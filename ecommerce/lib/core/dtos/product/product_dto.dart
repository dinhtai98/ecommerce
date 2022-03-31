import 'package:json_annotation/json_annotation.dart';
part 'product_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDto {
  String id;
  String barcode;
  String name;
  String image;
  double price;

  ProductDto({
    required this.barcode,
    required this.name,
    required this.id,
    required this.image,
    required this.price,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
