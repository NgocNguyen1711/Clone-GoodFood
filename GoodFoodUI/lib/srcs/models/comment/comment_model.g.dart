// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['id'] as int,
      thoiGian: DateTime.parse(json['thoiGian'] as String),
      noiDung: json['noiDung'] as String,
      idBaiViet: json['idBaiViet'] as int,
      idNguoiDung: json['idNguoiDung'] as int,
      tenNguoiDung: json['tenNguoiDung'] as String,
      idHinhAnh: json['idHinhAnh'] as int,
      isCommented: json['isCommented'] as bool,
      isOwnerComment: json['isOwnerComment'] as bool,
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thoiGian': instance.thoiGian.toIso8601String(),
      'noiDung': instance.noiDung,
      'idBaiViet': instance.idBaiViet,
      'idNguoiDung': instance.idNguoiDung,
      'tenNguoiDung': instance.tenNguoiDung,
      'idHinhAnh': instance.idHinhAnh,
      'isCommented': instance.isCommented,
      'isOwnerComment': instance.isOwnerComment,
    };
