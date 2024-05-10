// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regenerate_completion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegenerateCompletionRequestImpl _$$RegenerateCompletionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegenerateCompletionRequestImpl(
      messageId: (json['message_id'] as num).toInt(),
      tone: $enumDecodeNullable(_$RegenerationToneEnumMap, json['tone']),
      style: $enumDecodeNullable(_$RenegationStyleEnumMap, json['style']),
    );

Map<String, dynamic> _$$RegenerateCompletionRequestImplToJson(
        _$RegenerateCompletionRequestImpl instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'tone': _$RegenerationToneEnumMap[instance.tone],
      'style': _$RenegationStyleEnumMap[instance.style],
    };

const _$RegenerationToneEnumMap = {
  RegenerationTone.professional: 'professional',
  RegenerationTone.educator: 'educator',
  RegenerationTone.friendly: 'friendly',
  RegenerationTone.neutral: 'neutral',
};

const _$RenegationStyleEnumMap = {
  RenegationStyle.bulleted: 'bulleted',
  RenegationStyle.expanded: 'expanded',
  RenegationStyle.sentence: 'sentence',
};
