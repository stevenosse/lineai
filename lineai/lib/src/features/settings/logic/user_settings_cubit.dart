import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/user_settings/user_settings.dart';
import 'package:lineai/src/datasource/repositories/user_settings_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'user_settings_state.dart';
part 'user_settings_cubit.freezed.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  final UserSettingsRepository _userSettingsRepository;

  UserSettingsCubit({
    UserSettingsRepository? userSettingsRepository,
  })  : _userSettingsRepository = userSettingsRepository ?? locator<UserSettingsRepository>(),
        super(const UserSettingsState.initial(settings: UserSettings(groqApiKey: '')));

  void onGroqApiKeyChanged(String apiKey) {
    emit(UserSettingsState.initial(settings: state.settings.copyWith(groqApiKey: apiKey)));

    _saveSettings();
  }

  void getSettings() async {
    final response = await _userSettingsRepository.getUserSettings();
    response.when(
      success: (data) => emit(UserSettingsState.success(settings: data)),
      error: (error) => emit(UserSettingsState.error(settings: state.settings, error: error)),
    );
  }

  Future<void> _saveSettings() async {
    final response = await _userSettingsRepository.updateUserSettings(userSettings: state.settings);

    emit(UserSettingsState.loading(settings: state.settings));
    response.when(
      success: (data) => emit(UserSettingsState.success(settings: data)),
      error: (error) => emit(UserSettingsState.error(settings: state.settings, error: error)),
    );
  }
}
