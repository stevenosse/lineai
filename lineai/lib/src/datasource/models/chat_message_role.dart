import 'package:freezed_annotation/freezed_annotation.dart';

enum ChatMessageRole {
  @JsonKey(name: 'user')
  user,

  @JsonKey(name: 'assistant')
  assistant,

  @JsonKey(name: 'system')
  system;

  String get name => toString().split('.').last;
}
