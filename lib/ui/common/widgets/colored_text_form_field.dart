import 'package:flutter/material.dart';

const defaultColor = Colors.white;

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
    this.maxLines = 1,
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
  final int? maxLines;

  @override
  _ColoredTextFormFieldState createState() => _ColoredTextFormFieldState();
}

class _ColoredTextFormFieldState extends State<ColoredTextFormField> {
  late bool _passwordVisible;

  late final OutlineInputBorder coloredOutlineInputBorder;

  late final TextStyle? coloredTextStyle;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.obscureText;

    coloredOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.color,
      ),
    );
    coloredTextStyle = TextStyle(
      color: widget.color,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        maxLines: widget.maxLines,
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
