// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: (json['id'] as num).toInt(),
      role: $enumDecodeNullable(_$ChatMessageRoleEnumMap, json['role']) ??
          ChatMessageRole.user,
      content: json['content'] as String,
      conversationId: (json['conversation_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      answeredMessageId: (json['answered_message_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChatMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      'conversation_id': instance.conversationId,
      'created_at': instance.createdAt.toIso8601String(),
      'answered_message_id': instance.answeredMessageId,
    };

const _$ChatMessageRoleEnumMap = {
  ChatMessageRole.user: 'user',
  ChatMessageRole.assistant: 'assistant',
  ChatMessageRole.system: 'system',
};
