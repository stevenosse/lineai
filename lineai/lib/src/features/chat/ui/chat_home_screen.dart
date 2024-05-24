import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/models/chat_message_role.dart';
import 'package:lineai/src/datasource/models/message/message.dart';
import 'package:lineai/src/features/chat/logic/delete_message/delete_message_cubit.dart';
import 'package:lineai/src/features/chat/logic/message_list/message_list_bloc.dart';
import 'package:lineai/src/features/chat/logic/send_message/send_message_cubit.dart';
import 'package:lineai/src/features/chat/ui/components/chats_empty_state.dart';
import 'package:lineai/src/features/chat/ui/components/message_list.dart';
import 'package:lineai/src/features/chat/ui/components/send_message_form.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/features/chats/current_chat/chat_cubit.dart';
import 'package:lineai/src/shared/features/chats/regenerate_message/regenerate_message_cubit.dart';
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
  Message? _pendingMessage;
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
                unsaved: (conversation) => context.read<MessageListBloc>().setConversationId(conversation?.id),
                saved: (conversation, _) {
                  context.read<MessageListBloc>().setConversationId(conversation.id);
                  if (_pendingMessage != null) {
                    context
                        .read<SendMessageCubit>()
                        .sendMessage(conversationId: conversation.id!, content: _pendingMessage!.content);
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
                error: (conversation, error) => ApiErrorDialog.show(context: context, error: error),
              );
            },
          ),
          BlocListener<SendMessageCubit, SendMessageState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (content, conversationId, error) {
                  ApiErrorDialog.show(context: context, error: error);
                },
                loading: (conversationId) => _messageController.clear(),
              );
            },
          ),
          BlocListener<RegenerateMessageCubit, RegenerateMessageState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (error) => ApiErrorDialog.show(context: context, error: error),
              );
            },
          ),
          BlocListener<MessageListBloc, MessageListState>(
            listener: (context, state) {
              setState(() => _pendingMessage = null);
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
                    final messages = [
                      ...state.messages,
                      if (_pendingMessage != null) _pendingMessage!,
                    ];
                    if (messages.isEmpty) {
                      return ChatsEmptyState(onTipsTapped: _onSendMessagePressed);
                    }

                    return BlocBuilder<SendMessageCubit, SendMessageState>(
                      builder: (context, sendMessageState) {
                        return MessageList(
                          messages: messages,
                          hasError: sendMessageState.maybeWhen(
                            error: (_, __, ___) => true,
                            orElse: () => false,
                          ),
                          currentlyRegeneratingMessageId:
                              context.watch<RegenerateMessageCubit>().state.regeneratingMessageId,
                          onCopy: (message) {
                            Clipboard.setData(ClipboardData(text: message.content));
                            $notificationService.showSuccessNotification(
                              context: context,
                              body: I18n.of(context).chat_copiedToClipboardMessage,
                            );
                          },
                          onRegenerate: (message) =>
                              context.read<RegenerateMessageCubit>().regenerateMessage(messageId: message.id),
                          onDelete: (message) => context.read<DeleteMessageCubit>().deleteMessage(message),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.spacing),
                child: Column(
                  children: [
                    BlocBuilder<SendMessageCubit, SendMessageState>(
                      builder: (context, state) {
                        final createConvoFailed = context.select((ChatCubit chatCubit) {
                          return chatCubit.state.maybeWhen(
                            error: (_, __) => true,
                            orElse: () => false,
                          );
                        });
                        final sendMessageFailed = state.maybeWhen(
                          error: (_, __, ___) => true,
                          orElse: () => false,
                        );

                        if ((sendMessageFailed || createConvoFailed) && _pendingMessage != null) {
                          return _SendMessageFailed(
                            onRetry: () {
                              _onSendMessagePressed(_pendingMessage!.content);
                            },
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
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
                        );
                      },
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

  void _onSendMessagePressed(String messageText) async {
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

    setState(() {
      final message = Message(
        id: 0,
        role: ChatMessageRole.user,
        content: messageText,
        conversationId: conversationId ?? 0,
        createdAt: DateTime.now(),
      );
      _pendingMessage = message;
    });
    if (conversationId == null) {
      context.read<ChatCubit>().createEmptyConversation();
    } else {
      await sendMessageCubit.sendMessage(conversationId: conversationId, content: messageText);
    }
  }
}

class _SendMessageFailed extends StatelessWidget {
  const _SendMessageFailed({
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          I18n.of(context).chat_messageFailure,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: context.colorScheme.error),
        ),
        TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(
            IconsaxPlusBroken.refresh,
            size: Dimens.iconSizeS,
          ),
          label: Text(I18n.of(context).chat_retryButton),
        ),
      ],
    );
  }
}
