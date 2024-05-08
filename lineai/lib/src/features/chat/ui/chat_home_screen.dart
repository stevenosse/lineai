import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/chat/logic/message_list/message_list_cubit.dart';
import 'package:lineai/src/features/chat/logic/send_message/send_message_cubit.dart';
import 'package:lineai/src/features/chat/ui/components/chats_empty_state.dart';
import 'package:lineai/src/features/chat/ui/components/message_list.dart';
import 'package:lineai/src/features/chat/ui/components/send_message_form.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/features/chats/chat_cubit.dart';
import 'package:lineai/src/shared/utils/notifications.dart';

@RoutePage()
class ChatHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SendMessageCubit(),
        ),
        BlocProvider(create: (context) => MessageListBloc()),
      ],
      child: this,
    );
  }
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  String? _pendingMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ChatCubit, ChatState>(
        listener: (context, state) {
          state.whenOrNull(
            saved: (conversation) {
              if (_pendingMessage != null) {
                context
                    .read<SendMessageCubit>()
                    .sendMessage(conversationId: conversation.id, message: _pendingMessage!);
                _pendingMessage = null;
              }

              context.read<MessageListBloc>().setConversationId(conversation.id);
            },
            error: (conversation, error) {
              $notificationService.showErrorNotification(
                context: context,
                body: error.describe(context: context),
              );
            },
          );
        },
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            children: [
              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  return _HomeBanner(
                    label: (state.conversation?.name.isEmpty ?? true)
                        ? I18n.of(context).chat_unnamedConversation
                        : state.conversation!.name,
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<MessageListBloc, MessageListState>(
                  builder: (context, state) {
                    if (state.messages.isEmpty) {
                      return const ChatsEmptyState();
                    }

                    return MessageList(messages: state.messages);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.spacing),
                child: SendMessageForm(
                  onSendMessage: _onSendMessagePressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSendMessagePressed(String message) async {
    final sendMessageCubit = context.read<SendMessageCubit>();
    final conversationId = context.read<ChatCubit>().state.conversation?.id;

    if (conversationId == null) {
      _pendingMessage = message;
      await context.read<ChatCubit>().saveConversation();
    } else {
      await sendMessageCubit.sendMessage(conversationId: conversationId, message: message);
    }
  }
}

class _HomeBanner extends StatelessWidget {
  const _HomeBanner({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing, vertical: Dimens.halfSpacing),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: context.colorScheme.onPrimary, fontWeight: FontWeight.bold),
      ),
    );
  }
}
