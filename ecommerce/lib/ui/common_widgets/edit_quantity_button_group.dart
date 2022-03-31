import 'package:flutter/material.dart';

class EditQuantityButtonGroup extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final Function(int)? onChanged;
  const EditQuantityButtonGroup({
    Key? key,
    this.initialValue = 0,
    this.minValue = 0,
    this.maxValue = 1000,
    this.onChanged,
  }) : super(key: key);

  @override
  _QuantityGroupButtonState createState() => _QuantityGroupButtonState();
}

class _QuantityGroupButtonState extends State<EditQuantityButtonGroup> {
  late int currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
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
      height: 60,
      width: 150,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (currentValue > widget.minValue) {
                    setState(() {
                      currentValue--;
                    });
                    widget.onChanged?.call(currentValue);
                  }
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
          const SizedBox(
            height: 20,
            child: VerticalDivider(
              color: Colors.grey,
              width: 1,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                currentValue.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
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
                onTap: () {
                  if (currentValue < widget.maxValue) {
                    setState(() {
                      currentValue++;
                    });
                    widget.onChanged?.call(currentValue);
                  }
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
