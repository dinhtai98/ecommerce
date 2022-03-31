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
}
