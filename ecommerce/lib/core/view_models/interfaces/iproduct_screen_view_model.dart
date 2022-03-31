import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

abstract class IProductScreenViewModel extends ChangeNotifier {
  int get position;
  set setPosition(int position);
  bool checkQuantityProductInProductTag();
  late bool isSearched;

  List<ProductTagDto> get productInTags;

  List<ProductDto> get products;
  List<ProductDto> get productDisplay;
  List<ProductDto> get allProductDisplay;
  int getIndexTag(String tagId);
  Future<void> initData({
    required List<ProductTagDto> products,
    required String tagId,
    required String instanceId,
  });

  late bool isProductGroupsScrollListenerDisable;
  ProductListScreenInstanceModel? getInstanceModel(String instanceId);
  int get tagButtonsListener;
  int get productGroupsListener;
  int get searchesListener;
  Future<void> selectTag({
    required int indexProductGroup,
    bool isClickedOnTagBtn = true,
  });
  void onSearch(String value);
  void disposeViewModel(String instanceId);
}

class ProductListScreenInstanceModel {
  final ItemScrollController tagButtonsItemScrollController;
  final ItemScrollController productGroupsItemScrollController;
  final ItemPositionsListener productGroupsItemPositionsListeners;

  ProductListScreenInstanceModel({
    required this.tagButtonsItemScrollController,
    required this.productGroupsItemScrollController,
    required this.productGroupsItemPositionsListeners,
  });
}
