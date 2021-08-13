import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/ui/login_screen/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/shows_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      checkRememberMeAndNavigateAppropriately(context);
    });

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
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: -1, end: 0),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.bounceOut,
                      builder: (context, value, child) => Transform.translate(
                        offset: Offset(0, value * 50),
                        child: child,
                      ),
                      child: SvgPicture.asset("assets/ic_triangle.svg"),
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) => Transform.scale(
                        scale: value,
                        child: child,
                      ),
                      child: Text(
                        "Shows",
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkRememberMeAndNavigateAppropriately(
      BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(prefsRememberMeKey) ?? false) {
      Navigator.of(context).popAndPushNamed(ShowsScreen.routeName);
    } else {
      Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
    }
  }
}
