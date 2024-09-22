// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as int,
      tieuDe: json['tieuDe'] as String,
      nhanXet: json['nhanXet'] as String,
      thoiGian: DateTime.parse(json['thoiGian'] as String),
      idHinhAnhQuanAn: json['idHinhAnhQuanAn'] as int,
      idQuanAn: json['idQuanAn'] as int,
      idNguoiDung: json['idNguoiDung'] as int,
      veSinh: (json['veSinh'] as num).toDouble(),
      huongVi: (json['huongVi'] as num).toDouble(),
      khongGian: (json['khongGian'] as num).toDouble(),
      giaCa: (json['giaCa'] as num).toDouble(),
      phucVu: (json['phucVu'] as num).toDouble(),
      like: json['like'] as int,
      favorite: json['favorite'] as int,
      comment: json['comment'] as int,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tieuDe': instance.tieuDe,
      'nhanXet': instance.nhanXet,
      'thoiGian': instance.thoiGian.toIso8601String(),
      'idHinhAnhQuanAn': instance.idHinhAnhQuanAn,
      'idQuanAn': instance.idQuanAn,
      'idNguoiDung': instance.idNguoiDung,
      'veSinh': instance.veSinh,
      'huongVi': instance.huongVi,
      'khongGian': instance.khongGian,
      'giaCa': instance.giaCa,
      'phucVu': instance.phucVu,
      'like': instance.like,
      'favorite': instance.favorite,
      'comment': instance.comment,
    };
