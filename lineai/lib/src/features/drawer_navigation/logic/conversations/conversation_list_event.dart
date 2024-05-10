import 'package:equatable/equatable.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';

abstract class ConversationListEvent extends Equatable {}

final class ConversationListUpdated extends ConversationListEvent {
  final List<Conversation> conversations;

  ConversationListUpdated({required this.conversations});

  @override
  List<Object?> get props => [conversations];
}

final class ConversationSearchQueryChanged extends ConversationListEvent {
  final String query;

  ConversationSearchQueryChanged({required this.query});

  @override
  List<Object?> get props => [query];
}

final class ConversationSearchExited extends ConversationListEvent {
  @override
  List<Object?> get props => [];
}