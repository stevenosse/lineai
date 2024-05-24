part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.unsaved({Conversation? conversation}) = _ChatStateUnsaved;

  const factory ChatState.saved({
    required Conversation conversation,
    @Default(false) bool isUpdated,
  }) = _ChatStateSaved;

  const factory ChatState.deleted() = _ChatStateDeleted;

  const factory ChatState.loading({Conversation? conversation}) = _ChatStateLoading;

  const factory ChatState.error({Conversation? conversation, required ApiError error}) = _ChatStateError;
}

extension ChatStateX on ChatState {
  Conversation? get conversation => maybeWhen(
        saved: (conversation, _) => conversation,
        unsaved: (conversation) => conversation,
        loading: (conversation) => conversation,
        orElse: () => null,
      );

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);
}
