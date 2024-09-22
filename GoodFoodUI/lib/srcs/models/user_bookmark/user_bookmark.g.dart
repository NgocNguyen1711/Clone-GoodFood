// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserBookmarkModel _$$_UserBookmarkModelFromJson(Map<String, dynamic> json) =>
    _$_UserBookmarkModel(
      id: json['id'] as int,
      idNguoiDung: json['idNguoiDung'] as int,
      baiViet: (json['baiViet'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      quanAn: (json['quanAn'] as List<dynamic>)
          .map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserBookmarkModelToJson(
        _$_UserBookmarkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idNguoiDung': instance.idNguoiDung,
      'baiViet': instance.baiViet,
      'quanAn': instance.quanAn,
    };
