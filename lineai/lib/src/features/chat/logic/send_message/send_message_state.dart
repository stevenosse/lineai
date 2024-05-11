part of 'send_message_cubit.dart';

@freezed
class SendMessageState with _$SendMessageState {
  const factory SendMessageState.initial() = _Initial;

  const factory SendMessageState.loading({
    required Message message,
    int? conversationId,
  }) = _Loading;

  const factory SendMessageState.success({
    required int conversationId,
  }) = _Success;

  const factory SendMessageState.error({
    required String content,
    int? conversationId,
    required ApiError error,
  }) = _Error;
}

extension SendMessageStateX on SendMessageState {
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  Message? get message => whenOrNull(loading: (message, _) => message);
}
