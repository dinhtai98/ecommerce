import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/core/ui_models/basket_ui_model.dart';
import 'package:flutter/material.dart';

abstract class IBasketScreenViewModel implements ChangeNotifier {
  Future<void> addProductToBasket(
    int qty, {
    ProductDto? product,
    String basketId = "",
  });
  Future<void> subtractProductInBasket(
    int qty, {
    ProductDto? product,
    String basketId = "",
  });

  int getQtyProductInList(
    String productId,
  );

  Future<void> loadBasket();
  Future<void> completeOrder();

  int getAmountItemInBaskets();
  Future<void> editBasketItemQuantity(BasketUIModel item, int qty);
  Future<void> clearBasket();
  List<BasketUIModel> get basketsUIModel;
  double get totalPrice;
}
