import 'package:flutter/material.dart';

import 'logger_utils.dart';

class ColorUtils {
  static Color fromString(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return const Color(0xffF2F2F2);
    }

    try {
      // rgba(247, 247, 247, 0.73)
      if (colorString.substring(0, 4) == 'rgba') {
        String tempString = colorString;
        tempString = tempString.substring(4);
        tempString = tempString.replaceAll('(', '');
        tempString = tempString.replaceAll(')', '');
        List<String> rgbaValueList = tempString.split(',');
        rgbaValueList = rgbaValueList.map((e) => e.trim()).toList();

        if (rgbaValueList.length != 4) {
          throw Exception('Invalid string color');
        }

        try {
          int red = int.parse(rgbaValueList[0]);
          int green = int.parse(rgbaValueList[1]);
          int blue = int.parse(rgbaValueList[2]);
          double alpha = double.parse(rgbaValueList[3]);
          return Color.fromRGBO(red, green, blue, alpha);
        } catch (e) {
          Future.wait([LoggerUtils.logException(e)]);
          throw e;
        }
      }

      // #f3e2d0
      final buffer = StringBuffer();
      if (colorString.length == 6 || colorString.length == 7) {
        buffer.write('ff');
      }
      buffer.write(colorString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      Future.wait([LoggerUtils.logException(e)]);
      return const Color(0xffF2F2F2);
    }
  }
  

  static const red = Color(0xFFFF3B2F);
  static const primaryRedColor = Color(0xFFFF3B2F);
  static const subColor = Color(0xFF9796A1);
  static const redDark = Color(0xFFE83939);
  static const redActive = Color(0xFFE83939);
  static const black60 = Color.fromRGBO(18, 18, 18, 0.6);
  static const black86 = Color(0xBD121212);
  static const black40 = Color(0x66121212);
  static const white = Colors.white;
  static const grey = Color(0xFF737373);
  static const pink = Color(0xFFFFE1E3);
  static const pinkDark = Color(0xFFFDB1B1);
  static const greyBlue = Color(0xFF2E3E5C);
  static const borderColor = Color(0xFFF5F4F9);
  static final activeButtonBackgroudColor =
      const Color(0xFFEA2027).withOpacity(0.1);
  static const background = Color(0xFFF5F4F9);
  static const greenDark = Color(0xFF00824B);
  static const green = Color(0xFF2FC554);
  static const titleColor = Color(0xFF222222);
  static const textColor = Color(0xFF7D849A);
}
