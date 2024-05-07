part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial({
    required String email,
    required String password,
  }) = _Initial;

  factory RegisterState.loading({
    required String email,
    required String password,
  }) = _Loading;

  factory RegisterState.error({
    required String email,
    required String password,
    required ApiError error,
  }) = _Error;

  factory RegisterState.success({
    required String email,
    required String password,
    required AuthResponse response,
  }) = _Success;
}
