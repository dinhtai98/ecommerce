import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:ecommerce/core/utils/string_extension.dart';
import 'package:ecommerce/core/view_models/interfaces/iproduct_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductScreenViewModel extends ChangeNotifier
    implements IProductScreenViewModel {
  bool _isProductGroupsScrollListenerDisable = false;

  @override
  bool get isProductGroupsScrollListenerDisable =>
      _isProductGroupsScrollListenerDisable;

  @override
  set isProductGroupsScrollListenerDisable(
      bool _isDisableProductGroupsScrollListenerNew) {
    _isProductGroupsScrollListenerDisable =
        _isDisableProductGroupsScrollListenerNew;
    notifyListeners();
  }

  List<ProductTagDto> _productInTags = [];
  @override
  List<ProductTagDto> get productInTags => _productInTags;

  List<ProductDto> _allProductDisplay = [];
  @override
  List<ProductDto> get allProductDisplay => _allProductDisplay;

  List<ProductDto> _productDisplay = [];
  @override
  List<ProductDto> get productDisplay => _productDisplay;

  List<ProductDto> _products = [];
  @override
  List<ProductDto> get products => _products;

  bool _isSearched = false;
  @override
  bool get isSearched => _isSearched;
  @override
  set isSearched(bool value) {
    _isSearched = value;
    notifyListeners();
  }

  int _position = 0;
  @override
  int get position => _position;

  Map<String, ProductListScreenInstanceModel> _instanceModel = {};
  late String _instanceId;
  @override
  ProductListScreenInstanceModel? getInstanceModel(String instanceId) {
    return _instanceModel[instanceId];
  }

  int _tagButtonsListener = 0;
  @override
  int get tagButtonsListener => _tagButtonsListener;

  int _productGroupsListener = 0;
  @override
  int get productGroupsListener => _productGroupsListener;

  int _searchesListener = 0;
  @override
  int get searchesListener => _searchesListener;

  @override
  bool checkQuantityProductInProductTag() {
    // TODO: implement checkQuantityProductInProductTag
    throw UnimplementedError();
  }

  @override
  int getIndexTag(String tagId) {
    for (var index = 0; index < productInTags.length; index++) {
      if (productInTags[index].id == tagId) {
        return index;
      }
    }
    return 0;
  }

  @override
  Future<void> initData({
    required List<ProductTagDto> products,
    required String tagId,
    required String instanceId,
  }) async {
    _instanceId = instanceId;
    _instanceModel[_instanceId] = ProductListScreenInstanceModel(
      tagButtonsItemScrollController: ItemScrollController(),
      productGroupsItemScrollController: ItemScrollController(),
      productGroupsItemPositionsListeners: ItemPositionsListener.create(),
    );
    _position = 0;
    _allProductDisplay.clear();
    _productDisplay.clear();
    _products.clear();
    _productInTags = products;

    _notifyTagButtons();
    _notifyProductGroups();
    notifyListeners();

    var indexTag = getIndexTag(tagId);
    if (indexTag > 0) {
      _position = indexTag;
      _notifyTagButtons();
      notifyListeners();

      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _jumpTo(position: _position);
      });
    }
    _addProductGroupsScrollListener();
  }

  @override
  set setPosition(int position) {
    _position = position;
    notifyListeners();
  }

  void _notifySearches() {
    _searchesListener++;
  }

  void _notifyTagButtons() {
    _tagButtonsListener++;
  }

  void _notifyProductGroups() {
    _productGroupsListener++;
  }

  void _addProductGroupsScrollListener() {
    var productGroupsListener =
        _instanceModel[_instanceId]!.productGroupsItemPositionsListeners;

    productGroupsListener.itemPositions.addListener(() {
      if (_isProductGroupsScrollListenerDisable) {
        return;
      }
      for (final item in productGroupsListener.itemPositions.value) {
        if (item.itemLeadingEdge <= 0) {
          selectTag(
            indexProductGroup: item.index,
            isClickedOnTagBtn: false,
          );
          return;
        }
      }
    });
  }

  void _jumpToProductGroupIndex({
    required int productGroupIndex,
  }) {
    _instanceModel[_instanceId]
        ?.tagButtonsItemScrollController
        .jumpTo(index: productGroupIndex);
    _instanceModel[_instanceId]
        ?.productGroupsItemScrollController
        .jumpTo(index: productGroupIndex);
  }

  void _jumpTo({
    required int position,
  }) {
    if (position >= 0) {
      _jumpToProductGroupIndex(
        productGroupIndex: position,
      );
    }
  }

  @override
  Future<void> selectTag(
      {required int indexProductGroup, bool isClickedOnTagBtn = true}) async {
    if (indexProductGroup == _position) {
      return;
    }
    _position = indexProductGroup;
    _notifyTagButtons();
    notifyListeners();
    if (isClickedOnTagBtn) {
      _isProductGroupsScrollListenerDisable = true;
    }
    await _scrollTo(
      indexProductGroup: _position,
      isScrollProductGroups: isClickedOnTagBtn,
    );
    if (isClickedOnTagBtn) {
      _isProductGroupsScrollListenerDisable = false;
    }
  }

  Future<void> _scrollTo({
    required int indexProductGroup,
    bool isScrollProductGroups = true,
  }) async {
    if (indexProductGroup >= 0) {
      var categoryBtnsScrollToFuture = isScrollProductGroups
          ? _instanceModel[_instanceId]!
              .tagButtonsItemScrollController
              .scrollTo(
                index: indexProductGroup,
                duration: const Duration(milliseconds: 200),
              )
          : Future.delayed(Duration.zero);

      var productGroupsScrollToFuture = isScrollProductGroups
          ? _instanceModel[_instanceId]!
              .productGroupsItemScrollController
              .scrollTo(
                index: indexProductGroup,
                duration: const Duration(milliseconds: 200),
              )
          : Future.delayed(Duration.zero);

      await Future.wait([
        categoryBtnsScrollToFuture,
        productGroupsScrollToFuture,
      ]).whenComplete(() => isScrollProductGroups
          ? Future.delayed(Duration.zero)
          : _instanceModel[_instanceId]!
              .tagButtonsItemScrollController
              .scrollTo(
                index: indexProductGroup,
                duration: const Duration(milliseconds: 200),
              ));
    }
  }

  @override
  void disposeViewModel(String instanceId) {
    _tagButtonsListener = 0;
    _productGroupsListener = 0;
    _searchesListener = 0;
    _allProductDisplay.clear();
    _productDisplay.clear();
    _products.clear();
    _instanceModel.remove(instanceId);
  }

  @override
  void onSearch(String value) {
    if (value.isNullOrEmpty()) {
      _productDisplay.clear();
    } else {
      _productDisplay.clear();
      _productDisplay.addAll(_products
          .where((p) => p.name.toLowerCase().contains(value.toLowerCase())));
    }
    _notifySearches();
    _notifyTagButtons();
    _notifyProductGroups();
    notifyListeners();
  }
}
