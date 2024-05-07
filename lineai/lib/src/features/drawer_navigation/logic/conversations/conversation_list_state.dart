part of 'conversation_list_bloc.dart';

@freezed
class ConversationListState with _$ConversationListState {
  const factory ConversationListState({
    required List<Conversation> conversations,
  }) = _ConversationListState;
}
