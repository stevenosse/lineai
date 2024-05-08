import 'package:equatable/equatable.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';

abstract class ConversationListEvent extends Equatable {}

final class OnConversationListUpdated extends ConversationListEvent {
  final List<Conversation> conversations;

  OnConversationListUpdated({required this.conversations});

  @override
  List<Object?> get props => [conversations];
}
