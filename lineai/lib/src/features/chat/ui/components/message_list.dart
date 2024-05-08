import 'package:flutter/widgets.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/features/chat/ui/components/chat_bubble.dart';

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

        return ChatBubble(message: message);
      },
    );
  }
}
