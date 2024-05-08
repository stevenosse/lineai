part of 'message_list_bloc.dart';

@freezed
class MessageListState with _$MessageListState {
  const factory MessageListState.initial({
    @Default(<Message>[]) List<Message> messages,
  }) = _Initial;
}
