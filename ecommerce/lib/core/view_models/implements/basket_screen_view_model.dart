import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/core/hive_database/entities/basket/basket_entity.dart';
import 'package:ecommerce/core/services/interfaces/ibasket_service.dart';
import 'package:ecommerce/core/ui_models/basket_ui_model.dart';
import 'package:ecommerce/core/utils/currency_utils.dart';
import 'package:ecommerce/core/utils/list_extension.dart';
import 'package:ecommerce/core/utils/logger_utils.dart';
import 'package:ecommerce/core/utils/string_extension.dart';
import 'package:ecommerce/core/view_models/interfaces/ibasket_screen_view_model.dart';
import 'package:ecommerce/global/locator.dart';
import 'package:ecommerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class BasketScreenViewModel extends ChangeNotifier
    implements IBasketScreenViewModel {
  double _totalPrice = 0;
  @override
  double get totalPrice => CurrencyUtils.currencyRound(_totalPrice);
  final IBasketItemService _basketItemService = locator<IBasketItemService>();
  @override
  Future<void> addProductToBasket(
    int qty, {
    ProductDto? product,
    String basketId = "",
  }) async {
    if (!basketId.isNullOrEmpty()) {
      for (var basketItem in _basketsUIModel) {
        if (basketItem.id == basketId) {
          basketItem.qty += qty;
          _totalPrice += basketItem.unitPrice * qty;
          await _basketItemService.updateBasketItemQuantity(
              basketItem.qty, basketId);
          await LoggerUtils.logInfo(
              "Add $qty x ${basketItem.productName} to basket");
          notifyListeners();
          return;
        }
      }
    } else {
      for (var basketItem in _basketsUIModel) {
        if (basketItem.productId == product!.id) {
          basketItem.qty += qty;
          _totalPrice += basketItem.unitPrice * qty;
          await _basketItemService.updateBasketItemQuantity(
              basketItem.qty, basketItem.id);
          await LoggerUtils.logInfo(
              "Add $qty x ${basketItem.productName} to basket");
          notifyListeners();
          return;
        }
      }
    }

    String id = const Uuid().v4();
    var basketItemEntity = BasketItemEntity(
      id: id,
      productId: product!.id,
      productName: product.name,
      unitPrice: product.price,
      qty: qty,
      image: product.image,
    );

    _basketsUIModel.insert(
      0,
      BasketUIModel(
        id: id,
        productId: product.id,
        productName: product.name,
        unitPrice: product.price,
        qty: qty,
        image: product.image,
      ),
    );
    _totalPrice += product.price * qty;
    await _basketItemService.insert(basketItemEntity);
    notifyListeners();
  }

  List<BasketUIModel> _basketsUIModel = [];
  @override
  List<BasketUIModel> get basketsUIModel => _basketsUIModel;

  @override
  Future<void> clearBasket() async {
    _totalPrice = 0;
    await _basketItemService.clearBasket();
    _basketsUIModel.clear();
    notifyListeners();
  }

  @override
  Future<void> editBasketItemQuantity(BasketUIModel item, int qty) async {
    if (qty == 0) {
      await _basketItemService.deleteBasketItem(item.id);
    } else {
      await _basketItemService.updateBasketItemQuantity(qty, item.id);
    }
    await loadBasket();
  }

  @override
  int getAmountItemInBaskets() {
    int amount = 0;
    for (var x in _basketsUIModel) {
      amount += x.qty;
    }
    return amount;
  }

  @override
  int getQtyProductInList(String productId) {
    int amountQty = 0;
    for (var x in _basketsUIModel) {
      if (x.productId == productId) {
        amountQty += x.qty;
      }
    }
    return amountQty;
  }

  Future<void> _subtractProduct(
    BasketUIModel basketUIModel,
    int qty,
  ) async {
    if (basketUIModel.qty > qty) {
      basketUIModel.qty -= qty;
      _totalPrice -= basketUIModel.unitPrice * qty;
      await _basketItemService.updateBasketItemQuantity(
          basketUIModel.qty, basketUIModel.id);
      notifyListeners();
    } else {
      _basketsUIModel.removeWhere((b) => b.id == basketUIModel.id);
      _totalPrice -= basketUIModel.unitPrice * qty;
      await _basketItemService.deleteBasketItem(basketUIModel.id);
      notifyListeners();
    }
  }

  @override
  Future<void> subtractProductInBasket(
    int qty, {
    ProductDto? product,
    String basketId = "",
  }) async {
    BasketUIModel? _basketUIModelDelete;
    if (!basketId.isNullOrEmpty()) {
      _basketUIModelDelete = _basketsUIModel
          .firstOrDefault((basketUIModel) => basketUIModel.id == basketId);
    } else {
      _basketUIModelDelete = _basketsUIModel.firstOrDefault(
          (basketUIModel) => basketUIModel.productId == product!.id);
    }
    if (_basketUIModelDelete != null) {
      await _subtractProduct(_basketUIModelDelete, qty);
    }
  }

  @override
  Future<void> loadBasket() async {
    _basketsUIModel.clear();
    List<BasketItemEntity> listBasketItem =
        _basketItemService.getBasketItems().toList();
    for (var basketItemEntity in listBasketItem) {
      _basketsUIModel.add(BasketUIModel.fromEntity(basketItemEntity));
    }
    _totalPrice = _basketsUIModel.sum((x) => x.unitPrice * x.qty);
    notifyListeners();
  }

  @override
  Future<void> completeOrder() async {
    _basketsUIModel.clear();
    await _basketItemService.clearBasket();
    Get.offAllNamed(MyRouter.home);
  }
}
