// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantTypeModel _$RestaurantTypeModelFromJson(Map<String, dynamic> json) {
  return _RestaurantTypeModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantTypeModel {
  int get id => throw _privateConstructorUsedError;
  String get tenTheLoai => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantTypeModelCopyWith<RestaurantTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantTypeModelCopyWith<$Res> {
  factory $RestaurantTypeModelCopyWith(
          RestaurantTypeModel value, $Res Function(RestaurantTypeModel) then) =
      _$RestaurantTypeModelCopyWithImpl<$Res, RestaurantTypeModel>;
  @useResult
  $Res call({int id, String tenTheLoai});
}

/// @nodoc
class _$RestaurantTypeModelCopyWithImpl<$Res, $Val extends RestaurantTypeModel>
    implements $RestaurantTypeModelCopyWith<$Res> {
  _$RestaurantTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenTheLoai = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tenTheLoai: null == tenTheLoai
          ? _value.tenTheLoai
          : tenTheLoai // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantTypeModelCopyWith<$Res>
    implements $RestaurantTypeModelCopyWith<$Res> {
  factory _$$_RestaurantTypeModelCopyWith(_$_RestaurantTypeModel value,
          $Res Function(_$_RestaurantTypeModel) then) =
      __$$_RestaurantTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String tenTheLoai});
}

/// @nodoc
class __$$_RestaurantTypeModelCopyWithImpl<$Res>
    extends _$RestaurantTypeModelCopyWithImpl<$Res, _$_RestaurantTypeModel>
    implements _$$_RestaurantTypeModelCopyWith<$Res> {
  __$$_RestaurantTypeModelCopyWithImpl(_$_RestaurantTypeModel _value,
      $Res Function(_$_RestaurantTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenTheLoai = null,
  }) {
    return _then(_$_RestaurantTypeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tenTheLoai: null == tenTheLoai
          ? _value.tenTheLoai
          : tenTheLoai // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantTypeModel implements _RestaurantTypeModel {
  const _$_RestaurantTypeModel({required this.id, required this.tenTheLoai});

  factory _$_RestaurantTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantTypeModelFromJson(json);

  @override
  final int id;
  @override
  final String tenTheLoai;

  @override
  String toString() {
    return 'RestaurantTypeModel(id: $id, tenTheLoai: $tenTheLoai)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenTheLoai, tenTheLoai) ||
                other.tenTheLoai == tenTheLoai));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tenTheLoai);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantTypeModelCopyWith<_$_RestaurantTypeModel> get copyWith =>
      __$$_RestaurantTypeModelCopyWithImpl<_$_RestaurantTypeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantTypeModelToJson(
      this,
    );
  }
}

abstract class _RestaurantTypeModel implements RestaurantTypeModel {
  const factory _RestaurantTypeModel(
      {required final int id,
      required final String tenTheLoai}) = _$_RestaurantTypeModel;

  factory _RestaurantTypeModel.fromJson(Map<String, dynamic> json) =
      _$_RestaurantTypeModel.fromJson;

  @override
  int get id;
  @override
  String get tenTheLoai;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantTypeModelCopyWith<_$_RestaurantTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
