part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  factory ResetPasswordState.initial({required String password}) = _Initial;

  factory ResetPasswordState.loading({required String password}) = _Loading;

  factory ResetPasswordState.success({required String password}) = _Success;

  factory ResetPasswordState.error({required String password, required ApiError error}) = _Error;
}
