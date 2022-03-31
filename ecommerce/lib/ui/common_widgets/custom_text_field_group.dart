import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldGroup extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String placeholder;
  final bool isRequired;
  final int maxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool readOnly;
  final bool isFocus;
  final bool enabled;
  final int? maxLength;
  final Function()? onTap;
  final Widget? suffixIcon;
  final double placeholderSize;
  final double fontSize;
  final bool isTitleCenter;
  final bool isContentCenter;

  const CustomTextFieldGroup({
    Key? key,
    this.controller,
    this.label = '',
    this.placeholder = '',
    this.isRequired = false,
    this.maxLines = 1,
    this.initialValue = '',
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.isFocus = false,
    this.placeholderSize = 20,
    this.fontSize = 20,
    this.isContentCenter = false,
    this.isTitleCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        isTitleCenter
            ? Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: label,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: isRequired == true ? ' *' : '',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                      ),
                    ),
                  ]),
                ),
              )
            : RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: isRequired == true ? ' *' : '',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
                ]),
              ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          textAlign: isContentCenter ? TextAlign.center : TextAlign.left,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          obscureText: obscureText,
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          style: TextStyle(
            fontSize: fontSize,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            filled: true,
            fillColor: !isFocus
                ? const Color.fromRGBO(247, 247, 247, 1)
                : Colors.white,
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: placeholderSize,
            ),
            isDense: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(242, 242, 242, 1)),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(242, 242, 242, 1)),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.lightBlueAccent[400]!, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(242, 242, 242, 1)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        )
      ],
    );
  }
}
