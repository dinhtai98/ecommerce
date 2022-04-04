import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  /// display text before price
  final String prefix;
  final String currencySymbol;
  final double priceBeforeDiscount;
  final double priceAfterDiscount;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  /// distance between 2 price values
  final double spacing;

  const PriceLabel({
    Key? key,
    this.prefix = '',
    required this.currencySymbol,
    required this.priceBeforeDiscount,
    required this.priceAfterDiscount,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.spacing = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (priceBeforeDiscount == priceAfterDiscount) {
      return Text(
        prefix + currencySymbol + priceAfterDiscount.toStringAsFixed(2),
        style: TextStyle(
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
        ),
      );
    } else {
      return Row(
        children: [
          Text(
            prefix + currencySymbol + priceBeforeDiscount.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontSize: fontSize,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          SizedBox(
            width: spacing,
          ),
          Text(
            currencySymbol + priceAfterDiscount.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontSize: fontSize,
            ),
          )
        ],
      );
    }
  }
}
