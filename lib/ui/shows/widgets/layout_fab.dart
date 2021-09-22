import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/ui/shows/shows_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LayoutFAB extends StatefulWidget {
  const LayoutFAB({Key? key}) : super(key: key);

  @override
  State<LayoutFAB> createState() => _LayoutFABState();
}

class _LayoutFABState extends State<LayoutFAB> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween(begin: pi / 2, end: 0.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (context.read(showsLayoutProvider).state == ShowsLayout.column) {
          context.read(showsLayoutProvider).state = ShowsLayout.grid;
          _animationController.forward();
        } else {
          context.read(showsLayoutProvider).state = ShowsLayout.column;
          _animationController.reverse();
        }
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.rotate(
          angle: _animation.value,
          child: child,
        ),
        child: SvgPicture.asset(
          'assets/images/layout_icon.svg',
          color: Colors.white,
        ),
      ),
    );
  }
}
