import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/api_response/api_response.dart';
import 'package:lineai/src/datasource/models/user_settings/user_settings.dart';
import 'package:lineai/src/datasource/repositories/base_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class UserSettingsRepository extends BaseRepository {
  final SupabaseClient _supabaseClient;

  UserSettingsRepository({
    SupabaseClient? supabaseClient,
  }) : _supabaseClient = supabaseClient ?? Supabase.instance.client;
  Future<ApiResponse<UserSettings?, ApiError>> getUserSettings() async {
    return runOperation(call: () async {
      final response = await _supabaseClient
          .from(DBConstants.userSettingsTable)
          .select()
          .eq('user_id', _supabaseClient.auth.currentUser!.id)
          .maybeSingle();

      return ApiResponse.success(response == null ? null : UserSettings.fromJson(response));
    });
  }

  Future<ApiResponse<UserSettings, ApiError>> updateUserSettings({required UserSettings userSettings}) async {
    return runOperation(call: () async {
      final response = await _supabaseClient
          .from(DBConstants.userSettingsTable)
          .upsert({...userSettings.toJson(), 'user_id': _supabaseClient.auth.currentUser!.id})
          .select()
          .single();

      return ApiResponse.success(UserSettings.fromJson(response));
    });
  }
}
