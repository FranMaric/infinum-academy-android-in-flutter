import 'package:flutter/material.dart';

const defaultColor = Colors.white;

const coloredOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: defaultColor,
  ),
);

const coloredTextStyle = TextStyle(color: defaultColor);

class ColoredTextFormField extends StatelessWidget {
  const ColoredTextFormField({
    Key? key,
    this.color = defaultColor,
    this.hintText,
    this.labelText,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  final Color color;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: color,
      controller: controller,
      keyboardType: keyboardType,
      style: coloredTextStyle,
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: coloredTextStyle,
        hintStyle: coloredTextStyle,
        border: coloredOutlineInputBorder,
        enabledBorder: coloredOutlineInputBorder,
        focusedBorder: coloredOutlineInputBorder,
      ),
    );
  }
}
