// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return _ConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ConversationModel {
  int get id => throw _privateConstructorUsedError;
  int get user1Id => throw _privateConstructorUsedError;
  int get user2Id => throw _privateConstructorUsedError;
  List<ChatModel> get chats => throw _privateConstructorUsedError;
  UserModel? get user1 => throw _privateConstructorUsedError;
  UserModel? get user2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationModelCopyWith<ConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationModelCopyWith<$Res> {
  factory $ConversationModelCopyWith(
          ConversationModel value, $Res Function(ConversationModel) then) =
      _$ConversationModelCopyWithImpl<$Res, ConversationModel>;
  @useResult
  $Res call(
      {int id,
      int user1Id,
      int user2Id,
      List<ChatModel> chats,
      UserModel? user1,
      UserModel? user2});

  $UserModelCopyWith<$Res>? get user1;
  $UserModelCopyWith<$Res>? get user2;
}

/// @nodoc
class _$ConversationModelCopyWithImpl<$Res, $Val extends ConversationModel>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user1Id = null,
    Object? user2Id = null,
    Object? chats = null,
    Object? user1 = freezed,
    Object? user2 = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user1Id: null == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as int,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      user1: freezed == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      user2: freezed == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user1 {
    if (_value.user1 == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user1!, (value) {
      return _then(_value.copyWith(user1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user2 {
    if (_value.user2 == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user2!, (value) {
      return _then(_value.copyWith(user2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConversationModelCopyWith<$Res>
    implements $ConversationModelCopyWith<$Res> {
  factory _$$_ConversationModelCopyWith(_$_ConversationModel value,
          $Res Function(_$_ConversationModel) then) =
      __$$_ConversationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user1Id,
      int user2Id,
      List<ChatModel> chats,
      UserModel? user1,
      UserModel? user2});

  @override
  $UserModelCopyWith<$Res>? get user1;
  @override
  $UserModelCopyWith<$Res>? get user2;
}

/// @nodoc
class __$$_ConversationModelCopyWithImpl<$Res>
    extends _$ConversationModelCopyWithImpl<$Res, _$_ConversationModel>
    implements _$$_ConversationModelCopyWith<$Res> {
  __$$_ConversationModelCopyWithImpl(
      _$_ConversationModel _value, $Res Function(_$_ConversationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user1Id = null,
    Object? user2Id = null,
    Object? chats = null,
    Object? user1 = freezed,
    Object? user2 = freezed,
  }) {
    return _then(_$_ConversationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user1Id: null == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as int,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      user1: freezed == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      user2: freezed == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConversationModel implements _ConversationModel {
  const _$_ConversationModel(
      {required this.id,
      required this.user1Id,
      required this.user2Id,
      required final List<ChatModel> chats,
      this.user1,
      this.user2})
      : _chats = chats;

  factory _$_ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationModelFromJson(json);

  @override
  final int id;
  @override
  final int user1Id;
  @override
  final int user2Id;
  final List<ChatModel> _chats;
  @override
  List<ChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  final UserModel? user1;
  @override
  final UserModel? user2;

  @override
  String toString() {
    return 'ConversationModel(id: $id, user1Id: $user1Id, user2Id: $user2Id, chats: $chats, user1: $user1, user2: $user2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user1Id, user1Id) || other.user1Id == user1Id) &&
            (identical(other.user2Id, user2Id) || other.user2Id == user2Id) &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            (identical(other.user1, user1) || other.user1 == user1) &&
            (identical(other.user2, user2) || other.user2 == user2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user1Id, user2Id,
      const DeepCollectionEquality().hash(_chats), user1, user2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConversationModelCopyWith<_$_ConversationModel> get copyWith =>
      __$$_ConversationModelCopyWithImpl<_$_ConversationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationModelToJson(
      this,
    );
  }
}

abstract class _ConversationModel implements ConversationModel {
  const factory _ConversationModel(
      {required final int id,
      required final int user1Id,
      required final int user2Id,
      required final List<ChatModel> chats,
      final UserModel? user1,
      final UserModel? user2}) = _$_ConversationModel;

  factory _ConversationModel.fromJson(Map<String, dynamic> json) =
      _$_ConversationModel.fromJson;

  @override
  int get id;
  @override
  int get user1Id;
  @override
  int get user2Id;
  @override
  List<ChatModel> get chats;
  @override
  UserModel? get user1;
  @override
  UserModel? get user2;
  @override
  @JsonKey(ignore: true)
  _$$_ConversationModelCopyWith<_$_ConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
