import 'package:flutter/material.dart';

class CenteredCircularProgressIndicator extends StatelessWidget {
  const CenteredCircularProgressIndicator({
    Key? key,
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.strokeWidth = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double strokeWidth;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: color ?? Theme.of(context).primaryColor,
        valueColor: valueColor,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        strokeWidth: strokeWidth,
        value: value,
      ),
    );
  }
}
