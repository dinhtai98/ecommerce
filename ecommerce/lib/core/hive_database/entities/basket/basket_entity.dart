import 'package:ecommerce/core/hive_database/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../base_entity.dart';

part 'basket_entity.g.dart';

@HiveType(typeId: HiveTypes.basket)
class BasketItemEntity extends BaseEntity {
  @HiveField(1)
  String productId;
  @HiveField(2)
  String productName;
  @HiveField(3)
  double unitPrice;
  @HiveField(4)
  int qty;
  @HiveField(5)
  String image;

  BasketItemEntity({
    String? id,
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.qty,
    required this.image,
  }) : super(id: id);

  BasketItemEntity clone() {
    return BasketItemEntity(
      id: const Uuid().v4(),
      productId: productId,
      productName: productName,
      unitPrice: unitPrice,
      qty: qty,
      image: image,
    );
  }
}
