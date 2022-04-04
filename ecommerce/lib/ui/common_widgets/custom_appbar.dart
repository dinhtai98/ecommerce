import 'package:ecommerce/core/utils/color_utils.dart';
import 'package:ecommerce/core/utils/text_style_utils.dart';
import 'package:ecommerce/core/view_models/interfaces/ibasket_screen_view_model.dart';
import 'package:ecommerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Function()? backFunc;
  final bool basketActive;
  const CustomAppbar(
      {Key? key, required this.title, this.backFunc, this.basketActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 90.h,
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyleUtils.largeHeading,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backFunc != null
                  ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 15.h, 0, 0),
                    child: IconButton(
                        onPressed: backFunc,
                        icon: const Icon(Icons.arrow_back_ios),
                        iconSize: 30.sp,
                      ),
                  )
                  : const SizedBox.shrink(),
              basketActive
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(MyRouter.basket);
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 5),
                        child: Center(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/shopping-basket-2.png',
                                    width: 60.w,
                                    height: 55.h,
                                    scale: 4,
                                  ),
                                  Consumer<IBasketScreenViewModel>(
                                      builder: (_, _viewModel, __) {
                                    return Positioned(
                                      top: 25,
                                      right: 20,
                                      child: Container(
                                        height: 20,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            color: ColorUtils.redDark,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            _viewModel
                                                .getAmountItemInBaskets()
                                                .toString(),
                                            style: const TextStyle(
                                              color: ColorUtils.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                              Text('Basket', style: TextStyleUtils.title1)
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ],
      ),
    );
  }
}
