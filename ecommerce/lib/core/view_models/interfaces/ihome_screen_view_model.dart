
import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:flutter/material.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  List<ProductTagDto> get productTags;
  Future<void> getProductTags();
}
