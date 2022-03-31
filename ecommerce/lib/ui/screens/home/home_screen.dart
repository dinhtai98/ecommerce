import 'dart:convert';

import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:ecommerce/core/utils/color_utils.dart';
import 'package:ecommerce/core/utils/text_style_utils.dart';
import 'package:ecommerce/core/view_models/interfaces/ihome_screen_view_model.dart';
import 'package:ecommerce/global/router.dart';
import 'package:ecommerce/ui/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

part 'widgets/tag_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IHomeScreenViewModel _viewModel;
  @override
  void initState() {
    _viewModel = context.read<IHomeScreenViewModel>();
    Future.delayed(Duration.zero, () {
      _viewModel.getProductTags();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Selector<IHomeScreenViewModel, int>(
                  selector: (_, __) => _viewModel.productTags.length,
                  builder: (_, __, ___) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300.sp,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: _viewModel.productTags.length,
                      itemBuilder: (BuildContext context, int index) {
                        var productTag = _viewModel.productTags[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              MyRouter.productScreen,
                              arguments: ProductScreenArguments(
                                productsInTag: _viewModel.productTags,
                                selectedTagId: productTag.id,
                              ),
                            );
                          },
                          child: TagItemWidget(productTag: productTag),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
