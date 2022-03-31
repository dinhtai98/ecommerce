import 'package:flutter/material.dart';

import 'custom_button.dart';

part 'custom_dialog_simple_yes_no.dart';

class CustomDialogActionButton {
  final void Function() onPressed;
  final Color btnColor;
  final Color textColor;
  final String text;
  final bool isContinue;

  CustomDialogActionButton({
    required this.onPressed,
    this.btnColor = const Color.fromRGBO(15, 191, 89, 1),
    this.textColor = Colors.white,
    this.text = '',
    this.isContinue = false,
  });
}

class CustomDialog extends StatelessWidget {
  final String titleText;
  final Widget content;
  final List<CustomDialogActionButton> actionButtons;

  const CustomDialog({
    Key? key,
    this.titleText = '',
    required this.content,
    this.actionButtons = const [],
  }) : super(key: key);

  List<Widget> _buildActionButtons() {
    return actionButtons.map((actionButton) {
      return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
        width: actionButton.isContinue ? 230 : 100,
        child: CustomButton(
          height: 40,
          onPressed: actionButton.onPressed,
          btnColor: actionButton.btnColor,
          textColor: actionButton.textColor,
          child: Text(
            actionButton.text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        title: Text(
          titleText,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        content: content,
        actions: <Widget>[
          ..._buildActionButtons(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
