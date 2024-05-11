import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/chat_message_role.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required int id,
    @Default(ChatMessageRole.user) ChatMessageRole role,
    required String content,
    @JsonKey(name: 'conversation_id') required int conversationId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'answered_message_id') int? answeredMessageId,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
