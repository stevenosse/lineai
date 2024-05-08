part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    Conversation? conversation,
  }) = _ChatState;
}
