part of 'send_message_cubit.dart';

@freezed
class SendMessageState with _$SendMessageState {
  const factory SendMessageState.initial() = _Initial;

  const factory SendMessageState.loading({
    required String message,
    int? conversationId,
  }) = _Loading;

  const factory SendMessageState.success({
    required String message,
    required int conversationId,
  }) = _Success;

  const factory SendMessageState.error({
    required String message,
    int? conversationId,
    required ApiError error,
  }) = _Error;
}

extension SendMessageStateX on SendMessageState {
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);
}