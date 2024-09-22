// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as int,
      thoiGian: DateTime.parse(json['thoiGian'] as String),
      noiDung: json['noiDung'] as String,
      idNguoiDung: json['idNguoiDung'] as int,
      loaiThongBao: json['loaiThongBao'] as int,
      daDoc: json['daDoc'] as bool,
      userId: json['userId'] as int,
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thoiGian': instance.thoiGian.toIso8601String(),
      'noiDung': instance.noiDung,
      'idNguoiDung': instance.idNguoiDung,
      'loaiThongBao': instance.loaiThongBao,
      'daDoc': instance.daDoc,
      'userId': instance.userId,
      'postId': instance.postId,
    };
