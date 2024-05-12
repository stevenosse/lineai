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

  Future<ApiResponse<bool, ApiError>> sendPasswordReset({required String email}) async {
    return runOperation(call: () async {
      await _supabaseClient.auth.resetPasswordForEmail(email);
      return ApiResponse.success(true);
    });
  }

  Future<ApiResponse<UserResponse, ApiError>> resetPassword({required String password}) async {
    return runOperation(call: () async {
      final response = await _supabaseClient.auth.updateUser(UserAttributes(
        password: password,
      ));

      return ApiResponse.success(response);
    });
  }
}
