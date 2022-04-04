import 'package:ecommerce/core/hive_database/entities/basket/basket_entity.dart';

class BasketUIModel {
  String id;
  String productId;
  String productName;
  double unitPrice;
  int qty;
  String image;

  BasketUIModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.qty,
    required this.image,
  });

  static BasketUIModel fromEntity(BasketItemEntity entity) {
    return BasketUIModel(
      id: entity.id,
      productId: entity.productId,
      productName: entity.productName,
      unitPrice: entity.unitPrice,
      qty: entity.qty,
      image: entity.image,
    );
  }

  BasketItemEntity toBasketItemEntity() {
    return BasketItemEntity(
      productId: productId,
      productName: productName,
      unitPrice: unitPrice,
      qty: qty,
      image: image
    );
  }
}
