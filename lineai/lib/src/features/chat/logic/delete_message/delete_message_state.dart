part of 'delete_message_cubit.dart';

@freezed
class DeleteMessageState with _$DeleteMessageState {
  const factory DeleteMessageState.initial({
    Message? message,
  }) = _Initial;

  const factory DeleteMessageState.loading({
    required Message message,
  }) = _Loading;

  const factory DeleteMessageState.success({
    required Message message,
  }) = _Success;

  const factory DeleteMessageState.error({
    required Message message,
    required ApiError error,
  }) = _Error;
}
