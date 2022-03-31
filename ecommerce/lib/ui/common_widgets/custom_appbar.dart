import 'package:ecommerce/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Function()? backFunc;
  const CustomAppbar({Key? key, required this.title, this.backFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 60.h,
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyleUtils.largeHeading,
            ),
          ),
          backFunc != null
              ? IconButton(
                  onPressed: backFunc,
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 30.sp,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
