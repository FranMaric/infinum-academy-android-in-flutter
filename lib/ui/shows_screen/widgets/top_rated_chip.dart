import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopRatedChip extends StatefulWidget {
  const TopRatedChip({Key? key, required this.onPressed}) : super(key: key);

  final void Function(bool) onPressed;

  @override
  _TopRatedChipState createState() => _TopRatedChipState();
}

class _TopRatedChipState extends State<TopRatedChip> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        'Top rated',
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: _isChecked ? Colors.white : Theme.of(context).primaryColor,
            ),
      ),
      backgroundColor: _isChecked ? Theme.of(context).primaryColor : Colors.white,
      shape: StadiumBorder(
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      avatar: SvgPicture.asset(
        'assets/images/heart_icon.svg',
        color: _isChecked ? Colors.white : Theme.of(context).primaryColor,
      ),
      onPressed: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onPressed(_isChecked);
        });
      },
    );
  }
}
