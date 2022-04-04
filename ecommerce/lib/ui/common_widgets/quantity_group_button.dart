import 'package:ecommerce/core/ui_models/basket_ui_model.dart';
import 'package:ecommerce/core/view_models/interfaces/ibasket_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityGroupButton extends StatefulWidget {
  final int currentValue;
  final BasketUIModel basketItem;
  final double width;
  final double height;
  const QuantityGroupButton({
    Key? key,
    required this.currentValue,
    required this.basketItem,
    this.height = 40,
    this.width = 100,
  }) : super(key: key);

  @override
  _QuantityGroupButtonState createState() => _QuantityGroupButtonState();
}

class _QuantityGroupButtonState extends State<QuantityGroupButton> {
  late int currentValue;

  late IBasketScreenViewModel _viewModelBasket;
  @override
  void initState() {
    _viewModelBasket = context.read<IBasketScreenViewModel>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentValue = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.8,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      height: widget.height,
      width: widget.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  _viewModelBasket.subtractProductInBasket(1,
                      basketId: widget.basketItem.id);
                },
                child: Center(
                  child: Icon(
                    Icons.remove,
                    size: 25,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 20,
            child: VerticalDivider(
              color: Colors.grey,
              width: 1,
            ),
          ),
          Expanded(
            child: Center(
                child: Text(
              widget.basketItem.qty.toString(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
          ),
          Container(
            height: 20,
            child: VerticalDivider(
              color: Colors.grey,
              width: 1,
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  _viewModelBasket.addProductToBasket(1,
                      basketId: widget.basketItem.id);
                },
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
