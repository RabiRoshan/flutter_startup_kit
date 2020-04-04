import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class TextFieldOne extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const TextFieldOne({
    Key key,
    this.controller,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: smallTextOneTextPrimaryColorReg,
      controller: controller,
      cursorColor: appPrimaryColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: appAccentColor,
        filled: true,
        hintStyle: smallTextOneTextSecondaryColorOneReg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
      ),
    );
  }
}
