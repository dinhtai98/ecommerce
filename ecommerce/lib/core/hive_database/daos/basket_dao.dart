import 'package:ecommerce/core/hive_database/entities/basket/basket_entity.dart';

import 'base_dao.dart';

class BasketDao extends BaseDao<BasketItemEntity> {
  /// update quantity
  Future<void> updateBasketItemQuantity(int qty, String basketId) async {
    BasketItemEntity? basketItemEntity = box.get(basketId);
    if (basketItemEntity != null) {
      basketItemEntity.qty = qty;
      if (box.containsKey(basketId)) {
        await box.put(basketId, basketItemEntity);
      }
    }
  }
}
