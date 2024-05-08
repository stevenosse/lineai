// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      model: json['model'] as String?,
      summary: json['summary'] as String?,
      systemPrompt: json['system_prompt'] as String? ?? '',
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'model': instance.model,
      'summary': instance.summary,
      'system_prompt': instance.systemPrompt,
      'temperature': instance.temperature,
    };
