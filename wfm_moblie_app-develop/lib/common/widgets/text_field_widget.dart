import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/fields_buttom_const.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final IconData? iconData;
  final String labelText;
  final bool isObscured;

  const TextFieldWidget(
      {Key? key,
      required this.textEditingController,
      required IconData this.iconData,
      required this.labelText,
      required this.isObscured})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(iconData),
          prefixIconColor: secondaryColor,
          border: const OutlineInputBorder(borderRadius: radius),
          errorBorder: const OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(color: errorColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(color: primaryColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isCollapsed: true),
      obscureText: isObscured,
    );
  }
}
