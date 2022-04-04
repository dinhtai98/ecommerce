import 'package:ecommerce/core/utils/color_utils.dart';
import 'package:ecommerce/core/utils/text_style_utils.dart';
import 'package:ecommerce/core/view_models/interfaces/ibasket_screen_view_model.dart';
import 'package:ecommerce/global/app_text.dart';
import 'package:ecommerce/global/global_data.dart';
import 'package:ecommerce/global/locator.dart';
import 'package:ecommerce/ui/common_widgets/custom_appbar.dart';
import 'package:ecommerce/ui/common_widgets/custom_button.dart';
import 'package:ecommerce/ui/common_widgets/price_label.dart';
import 'package:ecommerce/ui/screens/basket/widgets/basket_item_view.dart';
import 'package:ecommerce/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: "Basket",
              backFunc: () {
                Get.back();
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    AppText.lblYourBasket,
                    style: TextStyleUtils.title4,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SingleChildScrollView(
                  child: Consumer<IBasketScreenViewModel>(
                    builder: (_, _viewModel, __) {
                      return _viewModel.basketsUIModel.isNotEmpty
                          ? Container(
                              height: MediaQuery.of(context).size.height - 310,
                              child: ListView(
                                children: [
                                  ..._viewModel.basketsUIModel
                                      .map((b) => BasketItemView(
                                            basketUIModel: b,
                                          ))
                                ],
                              ))
                          : const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Consumer<IBasketScreenViewModel>(
              builder: (_, _viewModel, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () async {
                      if (_viewModel.basketsUIModel.isNotEmpty) {
                        await DialogUtils.showYesNoDialog(
                          title: 'Warning!',
                          body: 'Are you sure you want to clear basket?',
                          onYes: () async {
                            await _viewModel.clearBasket();
                            Get.back();
                          },
                          onNo: () {
                            Get.back();
                          },
                        );
                      }
                    },
                    child: Text(
                      AppText.lblClearBasket,
                      textAlign: TextAlign.left,
                      style: TextStyleUtils.subHeadingRegular.copyWith(
                          color: ColorUtils.blue, fontStyle: FontStyle.italic),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xffdddddd),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppText.lblTotalPrice,
                        style: TextStyleUtils.title,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                  Consumer<IBasketScreenViewModel>(
                      builder: (_, _viewModel, __) {
                    var totalPriceBeforeDiscount = _viewModel.totalPrice;
                    var totalPriceAfterDiscount = _viewModel.totalPrice;
                    var currencySymbol = locator<GlobalData>().currencySymbol;
                    return PriceLabel(
                      currencySymbol: currencySymbol,
                      priceBeforeDiscount: totalPriceBeforeDiscount,
                      priceAfterDiscount: totalPriceAfterDiscount,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    );
                  })
                ],
              ),
            ),
            const Spacer(),
            Consumer<IBasketScreenViewModel>(
              builder: (_, _viewModel, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomButton(
                    height: 50,
                    onPressed: () async {
                      await _viewModel.completeOrder();
                    },
                    btnColor: _viewModel.basketsUIModel.isNotEmpty
                        ? Colors.green
                        : Colors.grey,
                    child: Text(
                      AppText.lblPay,
                      style: TextStyleUtils.largeHeading,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
