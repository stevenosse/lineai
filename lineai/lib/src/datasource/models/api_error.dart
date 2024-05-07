import 'package:equatable/equatable.dart';

enum ApiErrorType {
  /// Something went wrong on the server side
  server,

  /// Something's wrong with the network request
  network,

  /// User did something wrong
  user,

  /// The error is unidentified
  unknown,
}

class ApiError<T> extends Equatable {
  final ApiErrorType type;
  final String? statusCode;
  final T error;

  const ApiError({
    required this.type,
    required this.error,
    this.statusCode,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiError<T> && other.type == type && other.error == error && other.statusCode == statusCode;
  }

  @override
  int get hashCode => type.hashCode ^ error.hashCode;

  @override
  List<Object?> get props => [type, error, statusCode];
}
