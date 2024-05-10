import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/chat/logic/message_list/message_list_bloc.dart';
import 'package:lineai/src/features/chat/logic/send_message/send_message_cubit.dart';
import 'package:lineai/src/features/chat/ui/components/chats_empty_state.dart';
import 'package:lineai/src/features/chat/ui/components/message_list.dart';
import 'package:lineai/src/features/chat/ui/components/send_message_form.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/features/chats/chat_cubit.dart';
import 'package:lineai/src/shared/utils/notifications_service.dart';

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
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<ChatCubit, ChatState>(
            listener: (context, state) {
              state.whenOrNull(
                unsaved: (conversation) => context.read<MessageListBloc>().setConversationId(null),
                saved: (conversation, _) {
                  context.read<MessageListBloc>().setConversationId(conversation.id);
                  if (_pendingMessage != null) {
                    context
                        .read<SendMessageCubit>()
                        .sendMessage(conversationId: conversation.id!, message: _pendingMessage!);
                    _pendingMessage = null;
                  }
                },
                deleted: () {
                  LoadingDialog.hide(context: context);
                  context.read<MessageListBloc>().setConversationId(null);
                  context.router.navigate(const ChatHomeRoute());

                  $notificationService.showSuccessNotification(
                    context: context,
                    body: I18n.of(context).chatSettings_deletedNotification,
                  );

                },
                error: (conversation, error) {
                  $notificationService.showErrorNotification(
                    context: context,
                    body: error.describe(context: context),
                  );
                },
              );
            },
          ),
          BlocListener<SendMessageCubit, SendMessageState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (message, conversationId, error) => $notificationService.showErrorNotification(
                  context: context,
                  body: error.describe(context: context),
                ),
                success: (conversationId, message) {
                  _messageController.clear();
                },
              );
            },
          ),
        ],
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<MessageListBloc, MessageListState>(
                  builder: (context, state) {
                    if (state.messages.isEmpty) {
                      return ChatsEmptyState(
                        onTipsTapped: _onSendMessagePressed,
                      );
                    }

                    return MessageList(messages: state.messages);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.spacing),
                child: Column(
                  children: [
                    SendMessageForm(
                      controller: _messageController,
                      onSendMessage: _onSendMessagePressed,
                      isLoading: context.watch<SendMessageCubit>().state.isLoading,
                    ),
                    const Gap.vertical(height: Dimens.spacing),
                    Text(
                      I18n.of(context).chat_garanteeNotice,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSendMessagePressed(String message) async {
    final settings = context.read<UserSettingsCubit>().state.settings;
    if (settings.groqApiKey.isEmpty) {
      $notificationService.showErrorNotification(
        context: context,
        body: I18n.of(context).settings_groqApiKeyError,
      );
      return;
    }

    final sendMessageCubit = context.read<SendMessageCubit>();
    final conversationId = context.read<ChatCubit>().state.conversation?.id;

    if (conversationId == null || conversationId == 0) {
      _pendingMessage = message;
      context.read<ChatCubit>().createEmptyConversation();
    } else {
      await sendMessageCubit.sendMessage(conversationId: conversationId, message: message);
    }
  }
}
