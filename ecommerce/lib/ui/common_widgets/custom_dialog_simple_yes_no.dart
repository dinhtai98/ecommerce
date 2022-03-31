part of 'custom_dialog.dart';

class CustomDialogSimple extends StatelessWidget {
  final String titleText;
  final String bodyText;
  final List<CustomDialogActionButton> actionButtons;

  const CustomDialogSimple({
    Key? key,
    this.titleText = '',
    this.bodyText = '',
    this.actionButtons = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      titleText: titleText,
      content: Text(
        bodyText,
        style: const TextStyle(fontSize: 17),
      ),
      actionButtons: actionButtons,
    );
  }
}
