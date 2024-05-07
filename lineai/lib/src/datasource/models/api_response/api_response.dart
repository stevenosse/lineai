import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<R, E> with _$ApiResponse<R, E> {
  factory ApiResponse.success(R response) = _ApiResponseSuccess;
  factory ApiResponse.error(E response) = _ApiResponseError;
}
