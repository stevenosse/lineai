part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial({
    required String email,
  }) = _Initial;

  const factory ForgotPasswordState.loading({
    required String email,
  }) = _Loading;

  const factory ForgotPasswordState.success({
    required String email,
  }) = _Success;

  const factory ForgotPasswordState.error({
    required String email,
    required ApiError error,
  }) = _Error;
}
