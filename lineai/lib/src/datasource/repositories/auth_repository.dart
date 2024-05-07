import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/api_response/api_response.dart';
import 'package:lineai/src/datasource/repositories/base_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository extends BaseRepository {
  final SupabaseClient _supabaseClient;

  AuthRepository({
    SupabaseClient? supabaseClient,
  }) : _supabaseClient = supabaseClient ?? Supabase.instance.client;

  Future<ApiResponse<AuthResponse, ApiError>> login({required String email, required String password}) async {
    return runOperation(call: () async {
      _supabaseClient.from('').select();
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return ApiResponse.success(response);
    });
  }

  Future<ApiResponse<AuthResponse, ApiError>> signUp({required String email, required String password}) async {
    return runOperation(call: () async {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      return ApiResponse.success(response);
    });
  }
}
