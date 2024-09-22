// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DishModel _$$_DishModelFromJson(Map<String, dynamic> json) => _$_DishModel(
      id: json['id'] as int,
      tenMon: json['tenMon'] as String,
      giaTien: json['giaTien'] as int,
      idQuanAn: json['idQuanAn'] as int,
      idHinhAnh: json['idHinhAnh'] as int,
      nhanXet: json['nhanXet'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$_DishModelToJson(_$_DishModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenMon': instance.tenMon,
      'giaTien': instance.giaTien,
      'idQuanAn': instance.idQuanAn,
      'idHinhAnh': instance.idHinhAnh,
      'nhanXet': instance.nhanXet,
      'imagePath': instance.imagePath,
    };
