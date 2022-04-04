import 'package:ecommerce/core/hive_database/daos/basket_dao.dart';
import 'package:ecommerce/core/hive_database/entities/basket/basket_entity.dart';
import 'package:ecommerce/core/services/interfaces/ibasket_service.dart';
import 'package:ecommerce/global/locator.dart';

class BasketItemService implements IBasketItemService {
  final _dao = locator<BasketDao>();

  @override
  List<BasketItemEntity> getBasketItems() {
    return _dao.getAll();
  }

  @override
  BasketItemEntity? getBasketItemById(String id) {
    return _dao.findById(id);
  }

  @override
  Future<void> insert(BasketItemEntity productEntity) async {
    await _dao.insert(productEntity);
  }

  @override
  Future<void> deleteBasketItem(String basketId) async {
    await _dao.delete(basketId);
  }

  @override
  Future<void> updateBasketItemQuantity(int qty, String basketId) async {
    await _dao.updateBasketItemQuantity(qty, basketId);
  }

  @override
  Future<void> clearBasket() async {
    await _dao.clear();
  }
}
