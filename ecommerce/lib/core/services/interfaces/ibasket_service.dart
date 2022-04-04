
import 'package:ecommerce/core/hive_database/entities/basket/basket_entity.dart';

abstract class IBasketItemService {
  List<BasketItemEntity> getBasketItems();
  BasketItemEntity? getBasketItemById(String id);
  Future<void> insert(BasketItemEntity basketItemEntity);
  Future<void> deleteBasketItem(String basketId);
  Future<void> updateBasketItemQuantity(int qty, String basketId);
  Future<void> clearBasket();
}
