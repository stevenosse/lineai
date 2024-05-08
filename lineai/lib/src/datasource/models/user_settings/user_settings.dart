import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    @JsonKey(name: 'groq_api_key') required String groqApiKey,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, Object?> json) => _$UserSettingsFromJson(json);
}
