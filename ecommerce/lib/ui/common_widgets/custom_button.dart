// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? height;
  final double minWidth;
  final Color? btnColor;
  final Color? textColor;
  final double? btnRadius;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? borderColor;
  final Color? disabledColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.height = 60,
    this.minWidth = double.infinity,
    this.btnColor,
    this.textColor = Colors.white,
    this.btnRadius = 7,
    this.padding,
    required this.child,
    this.borderColor,
    this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      height: height ?? 80.h,
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        padding: padding,
        color: btnColor ?? Colors.white,
        textColor: textColor,
        disabledColor: disabledColor ?? Colors.grey[400],
        disabledTextColor:  Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius ?? 2.r),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderColor != null ? 1 : 0,
            style: BorderStyle.solid,
          ),
        ),
        child: child,
      ),
    );
  }
}
