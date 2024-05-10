// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regenerate_completion_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegenerateCompletionRequest _$RegenerateCompletionRequestFromJson(
    Map<String, dynamic> json) {
  return _RegenerateCompletionRequest.fromJson(json);
}

/// @nodoc
mixin _$RegenerateCompletionRequest {
  @JsonKey(name: 'message_id')
  int get messageId => throw _privateConstructorUsedError;
  RegenerationTone? get tone => throw _privateConstructorUsedError;
  RenegationStyle? get style => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegenerateCompletionRequestCopyWith<RegenerateCompletionRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegenerateCompletionRequestCopyWith<$Res> {
  factory $RegenerateCompletionRequestCopyWith(
          RegenerateCompletionRequest value,
          $Res Function(RegenerateCompletionRequest) then) =
      _$RegenerateCompletionRequestCopyWithImpl<$Res,
          RegenerateCompletionRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message_id') int messageId,
      RegenerationTone? tone,
      RenegationStyle? style});
}

/// @nodoc
class _$RegenerateCompletionRequestCopyWithImpl<$Res,
        $Val extends RegenerateCompletionRequest>
    implements $RegenerateCompletionRequestCopyWith<$Res> {
  _$RegenerateCompletionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? tone = freezed,
    Object? style = freezed,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      tone: freezed == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as RegenerationTone?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as RenegationStyle?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegenerateCompletionRequestImplCopyWith<$Res>
    implements $RegenerateCompletionRequestCopyWith<$Res> {
  factory _$$RegenerateCompletionRequestImplCopyWith(
          _$RegenerateCompletionRequestImpl value,
          $Res Function(_$RegenerateCompletionRequestImpl) then) =
      __$$RegenerateCompletionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message_id') int messageId,
      RegenerationTone? tone,
      RenegationStyle? style});
}

/// @nodoc
class __$$RegenerateCompletionRequestImplCopyWithImpl<$Res>
    extends _$RegenerateCompletionRequestCopyWithImpl<$Res,
        _$RegenerateCompletionRequestImpl>
    implements _$$RegenerateCompletionRequestImplCopyWith<$Res> {
  __$$RegenerateCompletionRequestImplCopyWithImpl(
      _$RegenerateCompletionRequestImpl _value,
      $Res Function(_$RegenerateCompletionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? tone = freezed,
    Object? style = freezed,
  }) {
    return _then(_$RegenerateCompletionRequestImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      tone: freezed == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as RegenerationTone?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as RenegationStyle?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegenerateCompletionRequestImpl
    implements _RegenerateCompletionRequest {
  const _$RegenerateCompletionRequestImpl(
      {@JsonKey(name: 'message_id') required this.messageId,
      this.tone,
      this.style});

  factory _$RegenerateCompletionRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegenerateCompletionRequestImplFromJson(json);

  @override
  @JsonKey(name: 'message_id')
  final int messageId;
  @override
  final RegenerationTone? tone;
  @override
  final RenegationStyle? style;

  @override
  String toString() {
    return 'RegenerateCompletionRequest(messageId: $messageId, tone: $tone, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegenerateCompletionRequestImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, tone, style);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegenerateCompletionRequestImplCopyWith<_$RegenerateCompletionRequestImpl>
      get copyWith => __$$RegenerateCompletionRequestImplCopyWithImpl<
          _$RegenerateCompletionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegenerateCompletionRequestImplToJson(
      this,
    );
  }
}

abstract class _RegenerateCompletionRequest
    implements RegenerateCompletionRequest {
  const factory _RegenerateCompletionRequest(
      {@JsonKey(name: 'message_id') required final int messageId,
      final RegenerationTone? tone,
      final RenegationStyle? style}) = _$RegenerateCompletionRequestImpl;

  factory _RegenerateCompletionRequest.fromJson(Map<String, dynamic> json) =
      _$RegenerateCompletionRequestImpl.fromJson;

  @override
  @JsonKey(name: 'message_id')
  int get messageId;
  @override
  RegenerationTone? get tone;
  @override
  RenegationStyle? get style;
  @override
  @JsonKey(ignore: true)
  _$$RegenerateCompletionRequestImplCopyWith<_$RegenerateCompletionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
