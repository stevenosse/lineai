// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConversationListState {
  List<Conversation> get conversations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationListStateCopyWith<ConversationListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationListStateCopyWith<$Res> {
  factory $ConversationListStateCopyWith(ConversationListState value,
          $Res Function(ConversationListState) then) =
      _$ConversationListStateCopyWithImpl<$Res, ConversationListState>;
  @useResult
  $Res call({List<Conversation> conversations});
}

/// @nodoc
class _$ConversationListStateCopyWithImpl<$Res,
        $Val extends ConversationListState>
    implements $ConversationListStateCopyWith<$Res> {
  _$ConversationListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_value.copyWith(
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationListStateImplCopyWith<$Res>
    implements $ConversationListStateCopyWith<$Res> {
  factory _$$ConversationListStateImplCopyWith(
          _$ConversationListStateImpl value,
          $Res Function(_$ConversationListStateImpl) then) =
      __$$ConversationListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Conversation> conversations});
}

/// @nodoc
class __$$ConversationListStateImplCopyWithImpl<$Res>
    extends _$ConversationListStateCopyWithImpl<$Res,
        _$ConversationListStateImpl>
    implements _$$ConversationListStateImplCopyWith<$Res> {
  __$$ConversationListStateImplCopyWithImpl(_$ConversationListStateImpl _value,
      $Res Function(_$ConversationListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_$ConversationListStateImpl(
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc

class _$ConversationListStateImpl implements _ConversationListState {
  const _$ConversationListStateImpl(
      {required final List<Conversation> conversations})
      : _conversations = conversations;

  final List<Conversation> _conversations;
  @override
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  String toString() {
    return 'ConversationListState(conversations: $conversations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conversations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationListStateImplCopyWith<_$ConversationListStateImpl>
      get copyWith => __$$ConversationListStateImplCopyWithImpl<
          _$ConversationListStateImpl>(this, _$identity);
}

abstract class _ConversationListState implements ConversationListState {
  const factory _ConversationListState(
          {required final List<Conversation> conversations}) =
      _$ConversationListStateImpl;

  @override
  List<Conversation> get conversations;
  @override
  @JsonKey(ignore: true)
  _$$ConversationListStateImplCopyWith<_$ConversationListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
