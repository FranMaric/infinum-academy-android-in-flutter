import 'package:flutter/material.dart';

const defaultColor = Colors.white;

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
  }) : super(key: key);

  final Color color;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: color,
      keyboardType: keyboardType,
      style: TextStyle(
        color: color,
      ),
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: color,
        ),
        hintStyle: TextStyle(
          color: color,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
      ),
    );
  }
}
