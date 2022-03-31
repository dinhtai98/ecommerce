// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTagDto _$ProductTagDtoFromJson(Map<String, dynamic> json) =>
    ProductTagDto(
      name: json['name'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductTagDtoToJson(ProductTagDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
