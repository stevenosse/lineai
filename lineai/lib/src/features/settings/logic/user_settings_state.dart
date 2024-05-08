part of 'user_settings_cubit.dart';

@freezed
class UserSettingsState with _$UserSettingsState {
  const factory UserSettingsState.initial({required UserSettings settings}) = _Initial;

  factory UserSettingsState.loading({required UserSettings settings}) = _Loading;

  factory UserSettingsState.success({required UserSettings settings}) = _Success;

  factory UserSettingsState.error({required UserSettings settings, required ApiError error}) = _Error;
}
