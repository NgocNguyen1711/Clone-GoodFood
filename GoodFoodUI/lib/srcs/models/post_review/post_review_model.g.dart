// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostReviewModel _$$_PostReviewModelFromJson(Map<String, dynamic> json) =>
    _$_PostReviewModel(
      restaurantId: json['restaurantId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imagePath: json['imagePath'] as String,
      hygiene: (json['hygiene'] as num).toDouble(),
      taste: (json['taste'] as num).toDouble(),
      space: (json['space'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      service: (json['service'] as num).toDouble(),
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostReviewModelToJson(_$_PostReviewModel instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'title': instance.title,
      'content': instance.content,
      'imagePath': instance.imagePath,
      'hygiene': instance.hygiene,
      'taste': instance.taste,
      'space': instance.space,
      'price': instance.price,
      'service': instance.service,
      'dishes': instance.dishes,
    };
