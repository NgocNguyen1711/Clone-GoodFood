// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DishModel _$DishModelFromJson(Map<String, dynamic> json) {
  return _DishModel.fromJson(json);
}

/// @nodoc
mixin _$DishModel {
  int get id => throw _privateConstructorUsedError;
  String get tenMon => throw _privateConstructorUsedError;
  int get giaTien => throw _privateConstructorUsedError;
  int get idQuanAn => throw _privateConstructorUsedError;
  int get idHinhAnh => throw _privateConstructorUsedError;
  String get nhanXet => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishModelCopyWith<DishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishModelCopyWith<$Res> {
  factory $DishModelCopyWith(DishModel value, $Res Function(DishModel) then) =
      _$DishModelCopyWithImpl<$Res, DishModel>;
  @useResult
  $Res call(
      {int id,
      String tenMon,
      int giaTien,
      int idQuanAn,
      int idHinhAnh,
      String nhanXet,
      String imagePath});
}

/// @nodoc
class _$DishModelCopyWithImpl<$Res, $Val extends DishModel>
    implements $DishModelCopyWith<$Res> {
  _$DishModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenMon = null,
    Object? giaTien = null,
    Object? idQuanAn = null,
    Object? idHinhAnh = null,
    Object? nhanXet = null,
    Object? imagePath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tenMon: null == tenMon
          ? _value.tenMon
          : tenMon // ignore: cast_nullable_to_non_nullable
              as String,
      giaTien: null == giaTien
          ? _value.giaTien
          : giaTien // ignore: cast_nullable_to_non_nullable
              as int,
      idQuanAn: null == idQuanAn
          ? _value.idQuanAn
          : idQuanAn // ignore: cast_nullable_to_non_nullable
              as int,
      idHinhAnh: null == idHinhAnh
          ? _value.idHinhAnh
          : idHinhAnh // ignore: cast_nullable_to_non_nullable
              as int,
      nhanXet: null == nhanXet
          ? _value.nhanXet
          : nhanXet // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DishModelCopyWith<$Res> implements $DishModelCopyWith<$Res> {
  factory _$$_DishModelCopyWith(
          _$_DishModel value, $Res Function(_$_DishModel) then) =
      __$$_DishModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String tenMon,
      int giaTien,
      int idQuanAn,
      int idHinhAnh,
      String nhanXet,
      String imagePath});
}

/// @nodoc
class __$$_DishModelCopyWithImpl<$Res>
    extends _$DishModelCopyWithImpl<$Res, _$_DishModel>
    implements _$$_DishModelCopyWith<$Res> {
  __$$_DishModelCopyWithImpl(
      _$_DishModel _value, $Res Function(_$_DishModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenMon = null,
    Object? giaTien = null,
    Object? idQuanAn = null,
    Object? idHinhAnh = null,
    Object? nhanXet = null,
    Object? imagePath = null,
  }) {
    return _then(_$_DishModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tenMon: null == tenMon
          ? _value.tenMon
          : tenMon // ignore: cast_nullable_to_non_nullable
              as String,
      giaTien: null == giaTien
          ? _value.giaTien
          : giaTien // ignore: cast_nullable_to_non_nullable
              as int,
      idQuanAn: null == idQuanAn
          ? _value.idQuanAn
          : idQuanAn // ignore: cast_nullable_to_non_nullable
              as int,
      idHinhAnh: null == idHinhAnh
          ? _value.idHinhAnh
          : idHinhAnh // ignore: cast_nullable_to_non_nullable
              as int,
      nhanXet: null == nhanXet
          ? _value.nhanXet
          : nhanXet // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DishModel implements _DishModel {
  const _$_DishModel(
      {required this.id,
      required this.tenMon,
      required this.giaTien,
      required this.idQuanAn,
      required this.idHinhAnh,
      required this.nhanXet,
      required this.imagePath});

  factory _$_DishModel.fromJson(Map<String, dynamic> json) =>
      _$$_DishModelFromJson(json);

  @override
  final int id;
  @override
  final String tenMon;
  @override
  final int giaTien;
  @override
  final int idQuanAn;
  @override
  final int idHinhAnh;
  @override
  final String nhanXet;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'DishModel(id: $id, tenMon: $tenMon, giaTien: $giaTien, idQuanAn: $idQuanAn, idHinhAnh: $idHinhAnh, nhanXet: $nhanXet, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DishModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenMon, tenMon) || other.tenMon == tenMon) &&
            (identical(other.giaTien, giaTien) || other.giaTien == giaTien) &&
            (identical(other.idQuanAn, idQuanAn) ||
                other.idQuanAn == idQuanAn) &&
            (identical(other.idHinhAnh, idHinhAnh) ||
                other.idHinhAnh == idHinhAnh) &&
            (identical(other.nhanXet, nhanXet) || other.nhanXet == nhanXet) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tenMon, giaTien, idQuanAn,
      idHinhAnh, nhanXet, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DishModelCopyWith<_$_DishModel> get copyWith =>
      __$$_DishModelCopyWithImpl<_$_DishModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DishModelToJson(
      this,
    );
  }
}

abstract class _DishModel implements DishModel {
  const factory _DishModel(
      {required final int id,
      required final String tenMon,
      required final int giaTien,
      required final int idQuanAn,
      required final int idHinhAnh,
      required final String nhanXet,
      required final String imagePath}) = _$_DishModel;

  factory _DishModel.fromJson(Map<String, dynamic> json) =
      _$_DishModel.fromJson;

  @override
  int get id;
  @override
  String get tenMon;
  @override
  int get giaTien;
  @override
  int get idQuanAn;
  @override
  int get idHinhAnh;
  @override
  String get nhanXet;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$_DishModelCopyWith<_$_DishModel> get copyWith =>
      throw _privateConstructorUsedError;
}
