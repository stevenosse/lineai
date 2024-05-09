import 'package:entry/entry.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/features/chat/logic/delete_message/delete_message_cubit.dart';
import 'package:lineai/src/features/chat/ui/components/chat_bubble.dart';
import 'package:lineai/src/shared/utils/notifications_service.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key, required this.messages});

  final List<Message> messages;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients && widget.messages != oldWidget.messages) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        final message = widget.messages[index];

        // We don't display system messages
        if (message.role == 'system') {
          return const SizedBox.shrink();
        }

        return Entry(
          key: ValueKey('message-${message.id}'),
          child: ChatBubble(
            message: message,
            onCopy: () {
              Clipboard.setData(ClipboardData(text: message.content));
              $notificationService.showSuccessNotification(
                context: context,
                body: I18n.of(context).chat_copiedToClipboardMessage,
              );
            },
            onDelete: () async {
              context.read<DeleteMessageCubit>().deleteMessage(message);
            },
          ),
        );
      },
    );
  }
}
