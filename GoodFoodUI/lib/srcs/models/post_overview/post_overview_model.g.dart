// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostOverviewModel _$$_PostOverviewModelFromJson(Map<String, dynamic> json) =>
    _$_PostOverviewModel(
      id: json['id'] as int,
      username: json['username'] as String,
      userId: json['userId'] as int,
      avatar: json['avatar'] as int,
      tieuDe: json['tieuDe'] as String,
      nhanXet: json['nhanXet'] as String,
      thoiGian: DateTime.parse(json['thoiGian'] as String),
      image: json['image'] as int,
      like: json['like'] as int,
      comment: json['comment'] as int,
      favorite: json['favorite'] as int,
    );

Map<String, dynamic> _$$_PostOverviewModelToJson(
        _$_PostOverviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'userId': instance.userId,
      'avatar': instance.avatar,
      'tieuDe': instance.tieuDe,
      'nhanXet': instance.nhanXet,
      'thoiGian': instance.thoiGian.toIso8601String(),
      'image': instance.image,
      'like': instance.like,
      'comment': instance.comment,
      'favorite': instance.favorite,
    };
