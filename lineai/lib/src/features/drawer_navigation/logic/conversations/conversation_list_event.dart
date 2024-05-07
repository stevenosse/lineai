import 'package:lineai/src/datasource/models/conversation/conversation.dart';

abstract class ConversationListEvent {}

final class OnConversationListUpdated extends ConversationListEvent {
  final List<Conversation> conversations;
  OnConversationListUpdated(this.conversations);
}
