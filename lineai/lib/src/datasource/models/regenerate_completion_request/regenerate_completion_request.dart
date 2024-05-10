import 'package:freezed_annotation/freezed_annotation.dart';

part 'regenerate_completion_request.freezed.dart';
part 'regenerate_completion_request.g.dart';

enum RegenerationTone {
  @JsonValue('professional')
  professional,

  @JsonValue('educator')
  educator,

  @JsonValue('friendly')
  friendly,

  @JsonValue('neutral')
  neutral,
}

enum RenegationStyle {
  @JsonValue('bulleted')
  bulleted,

  @JsonValue('expanded')
  expanded,

  @JsonValue('sentence')
  sentence,
}

@freezed
class RegenerateCompletionRequest with _$RegenerateCompletionRequest {
  const factory RegenerateCompletionRequest({
    @JsonKey(name: 'message_id') required int messageId,
    RegenerationTone? tone,
    RenegationStyle? style,
  }) = _RegenerateCompletionRequest;

  factory RegenerateCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$RegenerateCompletionRequestFromJson(json);
}
