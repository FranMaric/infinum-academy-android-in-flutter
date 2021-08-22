import 'package:flutter/material.dart';

const defaultColor = Colors.white;

const coloredOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: defaultColor,
  ),
);

const coloredTextStyle = TextStyle(color: defaultColor);

class ColoredTextFormField extends StatefulWidget {
  const ColoredTextFormField({
    Key? key,
    this.obscureText = false,
    this.color = defaultColor,
    this.hintText,
    this.labelText,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.controller,
    this.margin,
  }) : super(key: key);

  final bool obscureText;
  final Color color;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final EdgeInsets? margin;

  @override
  _ColoredTextFormFieldState createState() => _ColoredTextFormFieldState();
}

class _ColoredTextFormFieldState extends State<ColoredTextFormField> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        obscureText: _passwordVisible,
        enableSuggestions: !widget.obscureText,
        autocorrect: !widget.obscureText,
        cursorColor: widget.color,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        style: coloredTextStyle,
        validator: widget.validator,
        onSaved: widget.onSaved,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: coloredTextStyle,
          hintStyle: coloredTextStyle,
          border: coloredOutlineInputBorder,
          enabledBorder: coloredOutlineInputBorder,
          focusedBorder: coloredOutlineInputBorder,
          suffixIcon: Visibility(
            visible: widget.obscureText,
            child: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: widget.color,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
