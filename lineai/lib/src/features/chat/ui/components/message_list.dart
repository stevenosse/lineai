import 'package:flutter/material.dart';
import 'package:lineai/src/datasource/models/chat_message_role.dart';
import 'package:lineai/src/datasource/models/message/message.dart';
import 'package:lineai/src/features/chat/ui/components/chat_bubble.dart';

class MessageList extends StatefulWidget {
  const MessageList({
    super.key,
    required this.messages,
    required this.onCopy,
    required this.onDelete,
    required this.onRegenerate,
    this.currentlyRegeneratingMessageId,
  });

  final int? currentlyRegeneratingMessageId;

  final List<Message> messages;
  final ValueChanged<Message> onCopy;
  final ValueChanged<Message> onDelete;
  final ValueChanged<Message> onRegenerate;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients && widget.messages != oldWidget.messages) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        );
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
        if (message.role == ChatMessageRole.system) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            ChatBubble(
              message: message,
              onCopy: () => widget.onCopy(message),
              onRegenerate: () => widget.onRegenerate(message),
              onDelete: () => widget.onDelete(message),
            ),
            if (message.id == widget.currentlyRegeneratingMessageId)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 2.5,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
