import 'dart:convert';

import 'package:ecommerce/core/ui_models/basket_ui_model.dart';
import 'package:ecommerce/core/utils/color_utils.dart';
import 'package:ecommerce/core/utils/string_extension.dart';
import 'package:ecommerce/core/utils/text_style_utils.dart';
import 'package:ecommerce/core/view_models/interfaces/ibasket_screen_view_model.dart';
import 'package:ecommerce/global/app_text.dart';
import 'package:ecommerce/global/global_data.dart';
import 'package:ecommerce/global/locator.dart';
import 'package:ecommerce/ui/common_widgets/custom_button.dart';
import 'package:ecommerce/ui/common_widgets/custom_dialog.dart';
import 'package:ecommerce/ui/common_widgets/custom_text_field_group.dart';
import 'package:ecommerce/ui/common_widgets/price_label.dart';
import 'package:ecommerce/ui/common_widgets/quantity_group_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BasketItemView extends StatefulWidget {
  final BasketUIModel basketUIModel;

  const BasketItemView({
    Key? key,
    required this.basketUIModel,
  }) : super(key: key);

  @override
  State<BasketItemView> createState() => _BasketItemViewState();
}

class _BasketItemViewState extends State<BasketItemView> {
  TextEditingController _focusTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
    var currencySymbol = locator<GlobalData>().currencySymbol;
    var priceBeforeDiscount =
        widget.basketUIModel.unitPrice * widget.basketUIModel.qty;
    return Column(
      children: [
        Slidable(
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              label: AppText.lblEditProduct,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: SimpleLineIcons.pencil,
              onPressed: (context) async {
                _focusTextController.text = '';
                await Get.dialog(showPopUpChangeQuantity(widget.basketUIModel));
              },
            ),
          ]),
          child: Container(
            padding: EdgeInsets.all(10.0.sp),
            decoration: BoxDecoration(
              color: ColorUtils.grey.withOpacity(.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      widget.basketUIModel.image.isNullOrEmpty()
                          ? Image.asset(
                              'assets/image-coming-soon.jpg',
                              width: 80,
                              alignment: Alignment.topCenter,
                            )
                          : Image.memory(
                              base64.decode(widget.basketUIModel.image),
                              width: 80,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fill,
                              gaplessPlayback: true,
                            ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Consumer<IBasketScreenViewModel>(
                            builder: (_, _viewModel, __) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.basketUIModel.productName,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleUtils.bodyStrong,
                              ),
                              PriceLabel(
                                prefix: AppText.lblTotal + ': ',
                                currencySymbol: currencySymbol,
                                priceBeforeDiscount: priceBeforeDiscount,
                                priceAfterDiscount: priceBeforeDiscount,
                                fontSize: 16,
                                spacing: 5,
                              ),
                            ],
                          );
                        }),
                      ),
                      QuantityGroupButton(
                        currentValue: widget.basketUIModel.qty,
                        basketItem: widget.basketUIModel,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget showPopUpChangeQuantity(BasketUIModel item) {
    return WillPopScope(
      onWillPop: () async {
        _focusTextController.text = '';
        Get.back();
        return true;
      },
      child: AlertDialog(
        content: SizedBox(
          height: 170,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFieldGroup(
                controller: _focusTextController,
                keyboardType: TextInputType.number,
                placeholder: 'Input quantity..',
                maxLines: 2,
                placeholderSize: 17,
                fontSize: 17,
                initialValue: null,
              ),
              CustomButton(
                height: 60,
                btnColor: Colors.blue,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_focusTextController.text.isNotEmpty) {
                    await context
                        .read<IBasketScreenViewModel>()
                        .editBasketItemQuantity(
                            item, int.parse(_focusTextController.text));
                    Get.back();
                  } else {
                    await Get.dialog(
                      CustomDialog(
                        titleText: "Quantity invalid!",
                        actionButtons: [
                          CustomDialogActionButton(
                            text: "Back",
                            onPressed: () {
                              _focusTextController.text = '';
                              Get.back();
                            },
                          ),
                        ],
                        content: const SizedBox.shrink(),
                      ),
                    );
                  }
                },
                child: Text(
                  AppText.lblOK,
                  style: TextStyleUtils.title4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
