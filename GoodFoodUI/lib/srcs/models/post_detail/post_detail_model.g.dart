// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostDetailModel _$$_PostDetailModelFromJson(Map<String, dynamic> json) =>
    _$_PostDetailModel(
      baiViet: PostModel.fromJson(json['baiViet'] as Map<String, dynamic>),
      quanAnDetail: RestaurantModel.fromJson(
          json['quanAnDetail'] as Map<String, dynamic>),
      nguoiDung: UserModel.fromJson(json['nguoiDung'] as Map<String, dynamic>),
      monAn: (json['monAn'] as List<dynamic>)
          .map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$$_PostDetailModelToJson(_$_PostDetailModel instance) =>
    <String, dynamic>{
      'baiViet': instance.baiViet,
      'quanAnDetail': instance.quanAnDetail,
      'nguoiDung': instance.nguoiDung,
      'monAn': instance.monAn,
      'isLiked': instance.isLiked,
    };
