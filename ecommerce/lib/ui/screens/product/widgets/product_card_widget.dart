import 'dart:convert';

import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/core/utils/color_utils.dart';
import 'package:ecommerce/core/utils/text_style_utils.dart';
import 'package:ecommerce/core/view_models/interfaces/ibasket_screen_view_model.dart';
import 'package:ecommerce/global/global_data.dart';
import 'package:ecommerce/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final ProductDto product;
  final String tagId;
  const ProductCard({Key? key, required this.product, required this.tagId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorUtils.grey,
                width: .5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.image != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        height: 60.sp,
                        width: 60.sp,
                        child: Image.memory(
                          base64.decode(product.image),
                          fit: BoxFit.fill,
                          gaplessPlayback: true,
                          cacheHeight: 60,
                          cacheWidth: 60,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        height: 60.sp,
                        width: 60.sp,
                        child: Image.asset(
                          "assets/image-coming-soon.jpg",
                          fit: BoxFit.fill,
                          cacheHeight: 60,
                          cacheWidth: 60,
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyleUtils.title4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                locator<GlobalData>().currencySymbol + "${product.price}",
                style: TextStyleUtils.title4,
              ),
              const SizedBox(
                width: 5,
              ),
              Consumer<IBasketScreenViewModel>(builder: (_, _viewModel, __) {
                return _viewModel.getQtyProductInList(product.id) == 0
                    ? Container(
                        width: 85.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: ColorUtils.yellow,
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(30.0.r),
                              bottomStart: Radius.circular(30.0.r)),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await _viewModel.addProductToBasket(
                              1,
                              product: product,
                            );
                          },
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyleUtils.title4,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Container(
                            width: 80.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              border: Border.all(width: .5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          size: 17.sp,
                                        ),
                                      ),
                                      onTap: () async {
                                        await _viewModel
                                            .subtractProductInBasket(
                                          1,
                                          product: product,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20.h,
                                  width: 25.w,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.black,
                                        width: .5,
                                      ),
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .5,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _viewModel
                                          .getQtyProductInList(product.id)
                                          .toString(),
                                      style: TextStyleUtils.title2,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 17.sp,
                                      )),
                                      onTap: () async {
                                        await _viewModel.addProductToBasket(
                                          1,
                                          product: product,
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
