// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      hoVaTen: json['hoVaTen'] as String?,
      soDienThoai: json['soDienThoai'] as String?,
      ngaySinh: json['ngaySinh'] == null
          ? null
          : DateTime.parse(json['ngaySinh'] as String),
      email: json['email'] as String?,
      gioiTinh: json['gioiTinh'] as String?,
      idHinhAnh: json['idHinhAnh'] as int?,
      imagePath: json['imagePath'] as String?,
      loaiNguoiDung: json['loaiNguoiDung'] as int,
      token: json['token'] as String,
      setTag: json['setTag'] as bool,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'hoVaTen': instance.hoVaTen,
      'soDienThoai': instance.soDienThoai,
      'ngaySinh': instance.ngaySinh?.toIso8601String(),
      'email': instance.email,
      'gioiTinh': instance.gioiTinh,
      'idHinhAnh': instance.idHinhAnh,
      'imagePath': instance.imagePath,
      'loaiNguoiDung': instance.loaiNguoiDung,
      'token': instance.token,
      'setTag': instance.setTag,
    };
