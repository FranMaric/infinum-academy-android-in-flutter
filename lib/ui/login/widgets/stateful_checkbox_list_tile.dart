import 'package:flutter/material.dart';

class StatefulCheckboxListTile extends StatefulWidget {
  const StatefulCheckboxListTile({
    Key? key,
    required this.onChanged,
    this.title,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.contentPadding = EdgeInsets.zero,
    this.startingValue = false,
    this.checkColor,
    this.activeColor,
  }) : super(key: key);

  final Widget? title;
  final ListTileControlAffinity controlAffinity;
  final void Function(bool) onChanged;
  final EdgeInsets? contentPadding;
  final bool startingValue;
  final Color? checkColor;
  final Color? activeColor;

  @override
  _StatefulCheckboxListTileState createState() => _StatefulCheckboxListTileState();
}

class _StatefulCheckboxListTileState extends State<StatefulCheckboxListTile> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.startingValue;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: widget.controlAffinity,
      title: widget.title,
      contentPadding: widget.contentPadding,
      value: _checked,
      activeColor: widget.activeColor ?? Colors.white,
      checkColor: widget.checkColor ?? Theme.of(context).backgroundColor,
      onChanged: (checked) {
        setState(() {
          _checked = checked ?? false;
        });
        widget.onChanged(checked ?? false);
      },
    );
  }
}
