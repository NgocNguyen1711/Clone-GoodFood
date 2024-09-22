// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBookmarkModel _$UserBookmarkModelFromJson(Map<String, dynamic> json) {
  return _UserBookmarkModel.fromJson(json);
}

/// @nodoc
mixin _$UserBookmarkModel {
  int get id => throw _privateConstructorUsedError;
  int get idNguoiDung => throw _privateConstructorUsedError;
  List<PostModel> get baiViet => throw _privateConstructorUsedError;
  List<RestaurantModel> get quanAn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBookmarkModelCopyWith<UserBookmarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBookmarkModelCopyWith<$Res> {
  factory $UserBookmarkModelCopyWith(
          UserBookmarkModel value, $Res Function(UserBookmarkModel) then) =
      _$UserBookmarkModelCopyWithImpl<$Res, UserBookmarkModel>;
  @useResult
  $Res call(
      {int id,
      int idNguoiDung,
      List<PostModel> baiViet,
      List<RestaurantModel> quanAn});
}

/// @nodoc
class _$UserBookmarkModelCopyWithImpl<$Res, $Val extends UserBookmarkModel>
    implements $UserBookmarkModelCopyWith<$Res> {
  _$UserBookmarkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idNguoiDung = null,
    Object? baiViet = null,
    Object? quanAn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idNguoiDung: null == idNguoiDung
          ? _value.idNguoiDung
          : idNguoiDung // ignore: cast_nullable_to_non_nullable
              as int,
      baiViet: null == baiViet
          ? _value.baiViet
          : baiViet // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      quanAn: null == quanAn
          ? _value.quanAn
          : quanAn // ignore: cast_nullable_to_non_nullable
              as List<RestaurantModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserBookmarkModelCopyWith<$Res>
    implements $UserBookmarkModelCopyWith<$Res> {
  factory _$$_UserBookmarkModelCopyWith(_$_UserBookmarkModel value,
          $Res Function(_$_UserBookmarkModel) then) =
      __$$_UserBookmarkModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int idNguoiDung,
      List<PostModel> baiViet,
      List<RestaurantModel> quanAn});
}

/// @nodoc
class __$$_UserBookmarkModelCopyWithImpl<$Res>
    extends _$UserBookmarkModelCopyWithImpl<$Res, _$_UserBookmarkModel>
    implements _$$_UserBookmarkModelCopyWith<$Res> {
  __$$_UserBookmarkModelCopyWithImpl(
      _$_UserBookmarkModel _value, $Res Function(_$_UserBookmarkModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idNguoiDung = null,
    Object? baiViet = null,
    Object? quanAn = null,
  }) {
    return _then(_$_UserBookmarkModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idNguoiDung: null == idNguoiDung
          ? _value.idNguoiDung
          : idNguoiDung // ignore: cast_nullable_to_non_nullable
              as int,
      baiViet: null == baiViet
          ? _value._baiViet
          : baiViet // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      quanAn: null == quanAn
          ? _value._quanAn
          : quanAn // ignore: cast_nullable_to_non_nullable
              as List<RestaurantModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserBookmarkModel implements _UserBookmarkModel {
  const _$_UserBookmarkModel(
      {required this.id,
      required this.idNguoiDung,
      required final List<PostModel> baiViet,
      required final List<RestaurantModel> quanAn})
      : _baiViet = baiViet,
        _quanAn = quanAn;

  factory _$_UserBookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserBookmarkModelFromJson(json);

  @override
  final int id;
  @override
  final int idNguoiDung;
  final List<PostModel> _baiViet;
  @override
  List<PostModel> get baiViet {
    if (_baiViet is EqualUnmodifiableListView) return _baiViet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baiViet);
  }

  final List<RestaurantModel> _quanAn;
  @override
  List<RestaurantModel> get quanAn {
    if (_quanAn is EqualUnmodifiableListView) return _quanAn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quanAn);
  }

  @override
  String toString() {
    return 'UserBookmarkModel(id: $id, idNguoiDung: $idNguoiDung, baiViet: $baiViet, quanAn: $quanAn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBookmarkModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idNguoiDung, idNguoiDung) ||
                other.idNguoiDung == idNguoiDung) &&
            const DeepCollectionEquality().equals(other._baiViet, _baiViet) &&
            const DeepCollectionEquality().equals(other._quanAn, _quanAn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idNguoiDung,
      const DeepCollectionEquality().hash(_baiViet),
      const DeepCollectionEquality().hash(_quanAn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBookmarkModelCopyWith<_$_UserBookmarkModel> get copyWith =>
      __$$_UserBookmarkModelCopyWithImpl<_$_UserBookmarkModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserBookmarkModelToJson(
      this,
    );
  }
}

abstract class _UserBookmarkModel implements UserBookmarkModel {
  const factory _UserBookmarkModel(
      {required final int id,
      required final int idNguoiDung,
      required final List<PostModel> baiViet,
      required final List<RestaurantModel> quanAn}) = _$_UserBookmarkModel;

  factory _UserBookmarkModel.fromJson(Map<String, dynamic> json) =
      _$_UserBookmarkModel.fromJson;

  @override
  int get id;
  @override
  int get idNguoiDung;
  @override
  List<PostModel> get baiViet;
  @override
  List<RestaurantModel> get quanAn;
  @override
  @JsonKey(ignore: true)
  _$$_UserBookmarkModelCopyWith<_$_UserBookmarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}
