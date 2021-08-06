import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/top_left_illustration.svg"),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/top_right_illustration.svg"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset("assets/bottom_right_illustration.svg"),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SvgPicture.asset("assets/bottom_left_illustration.svg"),
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/ic_triangle.svg"),
                    SizedBox(
                      width: 19,
                    ),
                    Text(
                      "Shows",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
