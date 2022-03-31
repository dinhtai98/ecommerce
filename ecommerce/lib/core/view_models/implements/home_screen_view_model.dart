import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:ecommerce/core/utils/mock_data.dart';
import 'package:ecommerce/core/view_models/interfaces/ihome_screen_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier
    implements IHomeScreenViewModel {
  @override
  Future<void> getProductTags() async {
    // _productTags = await getRestClient().getProductTags();

    //DEMO
    _productTags = MockData.getProductTagsDemo; 
    notifyListeners();
  }

  List<ProductTagDto> _productTags = [];
  @override
  List<ProductTagDto> get productTags => _productTags;
}
