// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantModel _$$_RestaurantModelFromJson(Map<String, dynamic> json) =>
    _$_RestaurantModel(
      idQuanAn: json['idQuanAn'] as int,
      tenQuanAn: json['tenQuanAn'] as String,
      diaChi: json['diaChi'] as String,
      placeId: json['placeId'] as String,
      gioMoCua: json['gioMoCua'] as String,
      gioDongCua: json['gioDongCua'] as String,
      hinhAnh: json['hinhAnh'] as String,
      theLoai: (json['theLoai'] as List<dynamic>)
          .map((e) => RestaurantTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      soDienThoai: json['soDienThoai'] as String,
      chatLuong: json['chatLuong'] as String,
      idNguoiSoHuu: json['idNguoiSoHuu'] as int,
      imagePath: json['imagePath'] as String?,
      idHinhAnh: json['idHinhAnh'] as int,
    );

Map<String, dynamic> _$$_RestaurantModelToJson(_$_RestaurantModel instance) =>
    <String, dynamic>{
      'idQuanAn': instance.idQuanAn,
      'tenQuanAn': instance.tenQuanAn,
      'diaChi': instance.diaChi,
      'placeId': instance.placeId,
      'gioMoCua': instance.gioMoCua,
      'gioDongCua': instance.gioDongCua,
      'hinhAnh': instance.hinhAnh,
      'theLoai': instance.theLoai,
      'soDienThoai': instance.soDienThoai,
      'chatLuong': instance.chatLuong,
      'idNguoiSoHuu': instance.idNguoiSoHuu,
      'imagePath': instance.imagePath,
      'idHinhAnh': instance.idHinhAnh,
    };
