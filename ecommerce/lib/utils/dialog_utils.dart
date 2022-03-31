import 'package:ecommerce/core/utils/enum.dart';
import 'package:ecommerce/global/app_text.dart';
import 'package:ecommerce/ui/common_widgets/custom_button.dart';
import 'package:ecommerce/ui/common_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'localization_utils.dart';

class DialogUtils {
  static Future<void> showYesNoDialog({
    String title = '',
    String body = '',
    void Function()? onYes,
    void Function()? onNo,
    bool barrierDismissible = false,
  }) async {
    onYes ??= () => {Get.back()};
    onNo ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title),
        bodyText: translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic('No'),
            onPressed: onNo,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic('Yes'),
            onPressed: onYes,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkCancelDialog({
    String title = '',
    String body = '',
    void Function()? onOK,
    void Function()? onCancel,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};
    onCancel ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title),
        bodyText: translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblCancel),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkDialog({
    String title = '',
    String body = '',
    void Function()? onOK,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title),
        bodyText: translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showRetryDialog({
    String title = '',
    String body = '',
    void Function()? onRetry,
    bool barrierDismissible = false,
  }) async {
    onRetry ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title),
        bodyText: translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic('Retry'),
            onPressed: onRetry,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueDialog({
    String title = '',
    String body = '',
    void Function()? onOK,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title),
        bodyText: translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinue),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueGoBackDialog({
    String title = '',
    String body = '',
    void Function()? onOK,
    void Function()? onCancel,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};
    onCancel ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title),
        bodyText: translations.textStatic(body),
        actionButtons: [
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblGoBack),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinueAnyway),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showYesNoBottomDialog(
    BuildContext context, {
    String body = '',
    void Function()? onNo,
    void Function()? onYes,
    BottomDialogType type = BottomDialogType.info,
    bool isSaveIt = false,
  }) async {
    onNo ??= () => {Get.back()};
    onYes ??= () => {Get.back()};
    var asset;
    switch (type) {
      case BottomDialogType.warning:
        asset = 'assets/images/dl-warning.png';
        break;
      case BottomDialogType.info:
        asset = 'assets/images/dl-info.png';
        break;
      case BottomDialogType.success:
        asset = 'assets/images/dl-success.png';
        break;
      case BottomDialogType.error:
        asset = 'assets/images/dl-error.png';
        break;
      default:
        asset = 'assets/images/dl-warning.png';
        break;
    }

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    asset,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Text(
                      body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        height: 50,
                        btnRadius: 5,
                        minWidth: MediaQuery.of(context).size.width / 2.2,
                        onPressed: onNo,
                        btnColor: const Color(0xffB0B1B1),
                        textColor: Colors.white,
                        child: Text(
                          isSaveIt ? AppText.lblNoSaveIt : AppText.lblGoBack,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomButton(
                        height: 50,
                        btnRadius: 5,
                        minWidth: MediaQuery.of(context).size.width / 2.2,
                        onPressed: onYes,
                        btnColor: const Color(0xffCC1212),
                        textColor: Colors.white,
                        child: const Text(
                          AppText.lblYes,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
