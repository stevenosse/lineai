part of 'regenerate_message_cubit.dart';

@freezed
class RegenerateMessageState with _$RegenerateMessageState {
  const factory RegenerateMessageState.initial() = _Initial;

  const factory RegenerateMessageState.loading({required int messageId}) = _Loading;

  const factory RegenerateMessageState.success() = _Success;
  const factory RegenerateMessageState.error({required ApiError error}) = _Error;
}

extension RegenerateMessageStateX on RegenerateMessageState {
  int? get regeneratingMessageId => maybeMap(loading: (state) => state.messageId, orElse: () => null);
}
