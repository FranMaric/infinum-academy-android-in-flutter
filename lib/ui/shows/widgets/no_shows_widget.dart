import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoShowsWidget extends StatelessWidget {
  const NoShowsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/images/no_shows_icon.svg'),
          const SizedBox(height: 26),
          Text(
            'Your shows are not showing. Get it?',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
