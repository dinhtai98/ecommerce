// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      barcode: json['barcode'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
    };
