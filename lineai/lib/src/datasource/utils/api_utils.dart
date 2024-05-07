import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

ApiError createApiErrorFromAuthError(AuthException error) {
  return ApiError(
    type: error.statusCode == null ? ApiErrorType.network : ApiErrorType.user,
    error: error,
    statusCode: error.statusCode,
  );
}

ApiError networkError(Object? e) {
  return ApiError(
    error: e,
    type: ApiErrorType.network,
  );
}

ApiError unknownError(Object? e) {
  return ApiError(
    error: e,
    type: ApiErrorType.unknown,
  );
}
