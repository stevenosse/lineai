// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  Conversation? get conversation => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Conversation? conversation) unsaved,
    required TResult Function(Conversation conversation, bool isUpdated) saved,
    required TResult Function(Conversation? conversation) loading,
    required TResult Function(
            Conversation? conversation, ApiError<dynamic> error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Conversation? conversation)? unsaved,
    TResult? Function(Conversation conversation, bool isUpdated)? saved,
    TResult? Function(Conversation? conversation)? loading,
    TResult? Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Conversation? conversation)? unsaved,
    TResult Function(Conversation conversation, bool isUpdated)? saved,
    TResult Function(Conversation? conversation)? loading,
    TResult Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStateUnsaved value) unsaved,
    required TResult Function(_ChatStateSaved value) saved,
    required TResult Function(_ChatStateLoading value) loading,
    required TResult Function(_ChatStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStateUnsaved value)? unsaved,
    TResult? Function(_ChatStateSaved value)? saved,
    TResult? Function(_ChatStateLoading value)? loading,
    TResult? Function(_ChatStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStateUnsaved value)? unsaved,
    TResult Function(_ChatStateSaved value)? saved,
    TResult Function(_ChatStateLoading value)? loading,
    TResult Function(_ChatStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({Conversation conversation});

  $ConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = null,
  }) {
    return _then(_value.copyWith(
      conversation: null == conversation
          ? _value.conversation!
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $ConversationCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateUnsavedImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateUnsavedImplCopyWith(_$ChatStateUnsavedImpl value,
          $Res Function(_$ChatStateUnsavedImpl) then) =
      __$$ChatStateUnsavedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Conversation? conversation});

  @override
  $ConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$$ChatStateUnsavedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateUnsavedImpl>
    implements _$$ChatStateUnsavedImplCopyWith<$Res> {
  __$$ChatStateUnsavedImplCopyWithImpl(_$ChatStateUnsavedImpl _value,
      $Res Function(_$ChatStateUnsavedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = freezed,
  }) {
    return _then(_$ChatStateUnsavedImpl(
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
    ));
  }
}

/// @nodoc

class _$ChatStateUnsavedImpl implements _ChatStateUnsaved {
  const _$ChatStateUnsavedImpl({this.conversation});

  @override
  final Conversation? conversation;

  @override
  String toString() {
    return 'ChatState.unsaved(conversation: $conversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateUnsavedImpl &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateUnsavedImplCopyWith<_$ChatStateUnsavedImpl> get copyWith =>
      __$$ChatStateUnsavedImplCopyWithImpl<_$ChatStateUnsavedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Conversation? conversation) unsaved,
    required TResult Function(Conversation conversation, bool isUpdated) saved,
    required TResult Function(Conversation? conversation) loading,
    required TResult Function(
            Conversation? conversation, ApiError<dynamic> error)
        error,
  }) {
    return unsaved(conversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Conversation? conversation)? unsaved,
    TResult? Function(Conversation conversation, bool isUpdated)? saved,
    TResult? Function(Conversation? conversation)? loading,
    TResult? Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
  }) {
    return unsaved?.call(conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Conversation? conversation)? unsaved,
    TResult Function(Conversation conversation, bool isUpdated)? saved,
    TResult Function(Conversation? conversation)? loading,
    TResult Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
    required TResult orElse(),
  }) {
    if (unsaved != null) {
      return unsaved(conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStateUnsaved value) unsaved,
    required TResult Function(_ChatStateSaved value) saved,
    required TResult Function(_ChatStateLoading value) loading,
    required TResult Function(_ChatStateError value) error,
  }) {
    return unsaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStateUnsaved value)? unsaved,
    TResult? Function(_ChatStateSaved value)? saved,
    TResult? Function(_ChatStateLoading value)? loading,
    TResult? Function(_ChatStateError value)? error,
  }) {
    return unsaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStateUnsaved value)? unsaved,
    TResult Function(_ChatStateSaved value)? saved,
    TResult Function(_ChatStateLoading value)? loading,
    TResult Function(_ChatStateError value)? error,
    required TResult orElse(),
  }) {
    if (unsaved != null) {
      return unsaved(this);
    }
    return orElse();
  }
}

abstract class _ChatStateUnsaved implements ChatState {
  const factory _ChatStateUnsaved({final Conversation? conversation}) =
      _$ChatStateUnsavedImpl;

  @override
  Conversation? get conversation;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateUnsavedImplCopyWith<_$ChatStateUnsavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatStateSavedImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateSavedImplCopyWith(_$ChatStateSavedImpl value,
          $Res Function(_$ChatStateSavedImpl) then) =
      __$$ChatStateSavedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Conversation conversation, bool isUpdated});

  @override
  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class __$$ChatStateSavedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateSavedImpl>
    implements _$$ChatStateSavedImplCopyWith<$Res> {
  __$$ChatStateSavedImplCopyWithImpl(
      _$ChatStateSavedImpl _value, $Res Function(_$ChatStateSavedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = null,
    Object? isUpdated = null,
  }) {
    return _then(_$ChatStateSavedImpl(
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<$Res> get conversation {
    return $ConversationCopyWith<$Res>(_value.conversation, (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }
}

/// @nodoc

class _$ChatStateSavedImpl implements _ChatStateSaved {
  const _$ChatStateSavedImpl(
      {required this.conversation, this.isUpdated = false});

  @override
  final Conversation conversation;
  @override
  @JsonKey()
  final bool isUpdated;

  @override
  String toString() {
    return 'ChatState.saved(conversation: $conversation, isUpdated: $isUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateSavedImpl &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            (identical(other.isUpdated, isUpdated) ||
                other.isUpdated == isUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation, isUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateSavedImplCopyWith<_$ChatStateSavedImpl> get copyWith =>
      __$$ChatStateSavedImplCopyWithImpl<_$ChatStateSavedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Conversation? conversation) unsaved,
    required TResult Function(Conversation conversation, bool isUpdated) saved,
    required TResult Function(Conversation? conversation) loading,
    required TResult Function(
            Conversation? conversation, ApiError<dynamic> error)
        error,
  }) {
    return saved(conversation, isUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Conversation? conversation)? unsaved,
    TResult? Function(Conversation conversation, bool isUpdated)? saved,
    TResult? Function(Conversation? conversation)? loading,
    TResult? Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
  }) {
    return saved?.call(conversation, isUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Conversation? conversation)? unsaved,
    TResult Function(Conversation conversation, bool isUpdated)? saved,
    TResult Function(Conversation? conversation)? loading,
    TResult Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(conversation, isUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStateUnsaved value) unsaved,
    required TResult Function(_ChatStateSaved value) saved,
    required TResult Function(_ChatStateLoading value) loading,
    required TResult Function(_ChatStateError value) error,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStateUnsaved value)? unsaved,
    TResult? Function(_ChatStateSaved value)? saved,
    TResult? Function(_ChatStateLoading value)? loading,
    TResult? Function(_ChatStateError value)? error,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStateUnsaved value)? unsaved,
    TResult Function(_ChatStateSaved value)? saved,
    TResult Function(_ChatStateLoading value)? loading,
    TResult Function(_ChatStateError value)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _ChatStateSaved implements ChatState {
  const factory _ChatStateSaved(
      {required final Conversation conversation,
      final bool isUpdated}) = _$ChatStateSavedImpl;

  @override
  Conversation get conversation;
  bool get isUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateSavedImplCopyWith<_$ChatStateSavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatStateLoadingImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateLoadingImplCopyWith(_$ChatStateLoadingImpl value,
          $Res Function(_$ChatStateLoadingImpl) then) =
      __$$ChatStateLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Conversation? conversation});

  @override
  $ConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$$ChatStateLoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateLoadingImpl>
    implements _$$ChatStateLoadingImplCopyWith<$Res> {
  __$$ChatStateLoadingImplCopyWithImpl(_$ChatStateLoadingImpl _value,
      $Res Function(_$ChatStateLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = freezed,
  }) {
    return _then(_$ChatStateLoadingImpl(
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
    ));
  }
}

/// @nodoc

class _$ChatStateLoadingImpl implements _ChatStateLoading {
  const _$ChatStateLoadingImpl({this.conversation});

  @override
  final Conversation? conversation;

  @override
  String toString() {
    return 'ChatState.loading(conversation: $conversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateLoadingImpl &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateLoadingImplCopyWith<_$ChatStateLoadingImpl> get copyWith =>
      __$$ChatStateLoadingImplCopyWithImpl<_$ChatStateLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Conversation? conversation) unsaved,
    required TResult Function(Conversation conversation, bool isUpdated) saved,
    required TResult Function(Conversation? conversation) loading,
    required TResult Function(
            Conversation? conversation, ApiError<dynamic> error)
        error,
  }) {
    return loading(conversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Conversation? conversation)? unsaved,
    TResult? Function(Conversation conversation, bool isUpdated)? saved,
    TResult? Function(Conversation? conversation)? loading,
    TResult? Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
  }) {
    return loading?.call(conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Conversation? conversation)? unsaved,
    TResult Function(Conversation conversation, bool isUpdated)? saved,
    TResult Function(Conversation? conversation)? loading,
    TResult Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStateUnsaved value) unsaved,
    required TResult Function(_ChatStateSaved value) saved,
    required TResult Function(_ChatStateLoading value) loading,
    required TResult Function(_ChatStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStateUnsaved value)? unsaved,
    TResult? Function(_ChatStateSaved value)? saved,
    TResult? Function(_ChatStateLoading value)? loading,
    TResult? Function(_ChatStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStateUnsaved value)? unsaved,
    TResult Function(_ChatStateSaved value)? saved,
    TResult Function(_ChatStateLoading value)? loading,
    TResult Function(_ChatStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ChatStateLoading implements ChatState {
  const factory _ChatStateLoading({final Conversation? conversation}) =
      _$ChatStateLoadingImpl;

  @override
  Conversation? get conversation;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateLoadingImplCopyWith<_$ChatStateLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatStateErrorImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateErrorImplCopyWith(_$ChatStateErrorImpl value,
          $Res Function(_$ChatStateErrorImpl) then) =
      __$$ChatStateErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Conversation? conversation, ApiError<dynamic> error});

  @override
  $ConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$$ChatStateErrorImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateErrorImpl>
    implements _$$ChatStateErrorImplCopyWith<$Res> {
  __$$ChatStateErrorImplCopyWithImpl(
      _$ChatStateErrorImpl _value, $Res Function(_$ChatStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversation = freezed,
    Object? error = null,
  }) {
    return _then(_$ChatStateErrorImpl(
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError<dynamic>,
    ));
  }
}

/// @nodoc

class _$ChatStateErrorImpl implements _ChatStateError {
  const _$ChatStateErrorImpl({this.conversation, required this.error});

  @override
  final Conversation? conversation;
  @override
  final ApiError<dynamic> error;

  @override
  String toString() {
    return 'ChatState.error(conversation: $conversation, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateErrorImpl &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateErrorImplCopyWith<_$ChatStateErrorImpl> get copyWith =>
      __$$ChatStateErrorImplCopyWithImpl<_$ChatStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Conversation? conversation) unsaved,
    required TResult Function(Conversation conversation, bool isUpdated) saved,
    required TResult Function(Conversation? conversation) loading,
    required TResult Function(
            Conversation? conversation, ApiError<dynamic> error)
        error,
  }) {
    return error(conversation, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Conversation? conversation)? unsaved,
    TResult? Function(Conversation conversation, bool isUpdated)? saved,
    TResult? Function(Conversation? conversation)? loading,
    TResult? Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
  }) {
    return error?.call(conversation, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Conversation? conversation)? unsaved,
    TResult Function(Conversation conversation, bool isUpdated)? saved,
    TResult Function(Conversation? conversation)? loading,
    TResult Function(Conversation? conversation, ApiError<dynamic> error)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(conversation, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStateUnsaved value) unsaved,
    required TResult Function(_ChatStateSaved value) saved,
    required TResult Function(_ChatStateLoading value) loading,
    required TResult Function(_ChatStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStateUnsaved value)? unsaved,
    TResult? Function(_ChatStateSaved value)? saved,
    TResult? Function(_ChatStateLoading value)? loading,
    TResult? Function(_ChatStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStateUnsaved value)? unsaved,
    TResult Function(_ChatStateSaved value)? saved,
    TResult Function(_ChatStateLoading value)? loading,
    TResult Function(_ChatStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ChatStateError implements ChatState {
  const factory _ChatStateError(
      {final Conversation? conversation,
      required final ApiError<dynamic> error}) = _$ChatStateErrorImpl;

  @override
  Conversation? get conversation;
  ApiError<dynamic> get error;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateErrorImplCopyWith<_$ChatStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
