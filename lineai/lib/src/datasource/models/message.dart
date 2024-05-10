import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required int id,
    required String role,
    required String content,
    @JsonKey(name: 'conversation_id') required int conversationId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'answered_message_id') int? answeredMessageId,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}