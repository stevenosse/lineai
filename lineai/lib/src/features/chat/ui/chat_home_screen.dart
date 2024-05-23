import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
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
                  unsaved: (conversation) => context.read<MessageListBloc>().setConversationId(conversation?.id),
                  saved: (conversation, _) {
                    context.read<MessageListBloc>().setConversationId(conversation.id);
                    if (_pendingMessage != null) {
                      context
                          .read<SendMessageCubit>()
                          .sendMessage(conversationId: conversation.id!, content: _pendingMessage!);
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
                  error: (content, conversationId, error) {
                    _messageController.text = content;
                    $notificationService.showErrorNotification(
                      context: context,
                      body: error.describe(context: context),
                    );
                  },
                  loading: (message, conversationId) => _messageController.clear(),
                );
              },
            ),
            BlocListener<RegenerateMessageCubit, RegenerateMessageState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (error) => ApiErrorDialog.show(context: context, error: error),
                );
              },
            )
          ],
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<MessageListBloc, MessageListState>(
                    builder: (context, state) {
                      if (state.messages.isEmpty) {
                        return ChatsEmptyState(onTipsTapped: _onSendMessagePressed);
                      }

                      return BlocBuilder<SendMessageCubit, SendMessageState>(
                        builder: (context, sendMessageState) {
                          // The send message is persisted when it appears in the list
                          final bool isMessageSent = state.messages.any(
                            (message) =>
                                message.content == sendMessageState.message?.content &&
                                message.role == sendMessageState.message?.role &&
                                message.conversationId == sendMessageState.message?.conversationId,
                          );

                          return MessageList(
                            messages: [
                              ...state.messages,
                              if (sendMessageState.message != null && !isMessageSent) sendMessageState.message!,
                            ],
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
          )),
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
      await sendMessageCubit.sendMessage(conversationId: conversationId, content: message);
    }
  }
}
