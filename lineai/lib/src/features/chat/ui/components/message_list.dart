import 'package:flutter/widgets.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/features/chat/ui/components/chat_bubble.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        
        // We don't display system messages
        if (message.role == 'system') {
          return const SizedBox.shrink();
        }

        return ChatBubble(message: message);
      },
    );
  }
}
