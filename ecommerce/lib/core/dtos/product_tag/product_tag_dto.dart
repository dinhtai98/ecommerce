import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_tag_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductTagDto {
  String id;
  String name;
  String image;
  List<ProductDto> products;

  ProductTagDto({
    required this.name,
    required this.id,
    required this.image,
    required this.products,
  });

  factory ProductTagDto.fromJson(Map<String, dynamic> json) =>
      _$ProductTagDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductTagDtoToJson(this);
}
