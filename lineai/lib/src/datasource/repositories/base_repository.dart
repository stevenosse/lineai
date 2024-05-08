import 'dart:io';

import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/api_response/api_response.dart';
import 'package:lineai/src/datasource/utils/api_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

typedef ApiCall<T> = Future<T> Function();

abstract class BaseRepository {
  Future<ApiResponse<T, ApiError>> runOperation<T>({required ApiCall<ApiResponse<T, ApiError>> call}) async {
    try {
      final response = await call();
      return response;
    } on AuthException catch (e) {
      return ApiResponse.error(createApiErrorFromAuthError(e));
    } on SocketException catch (e) {
      return ApiResponse.error(networkError(e));
    } on FunctionException catch (e) {
      return ApiResponse.error(createApiErrorFromFunctionError(e));
    } 
    catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }
}
