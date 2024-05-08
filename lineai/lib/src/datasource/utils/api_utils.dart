import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

ApiError createApiErrorFromAuthError(AuthException error) {
  return ApiError(
    type: error.statusCode == null ? ApiErrorType.network : ApiErrorType.user,
    error: error,
    statusCode: error.statusCode,
  );
}

ApiError createApiErrorFromFunctionError(FunctionException error) {
  return ApiError(
    type: switch (error.status.toString().substring(0, 1)) {
      '4' => ApiErrorType.user,
      '5' => ApiErrorType.server,
      _ => ApiErrorType.unknown,
    },
    error: error,
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
