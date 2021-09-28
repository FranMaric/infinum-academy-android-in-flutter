import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_preferences_provider.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/ui/login/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/shows_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future<void> checkRememberMeAndNavigateAppropriately() async {
      final prefs = context.read(sharedPreferencesProvider);

      final isLoggedIn = prefs.getBool(prefsRememberMeKey) ?? false;
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(ShowsScreen.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    }

    Future.delayed(const Duration(seconds: 2)).then((_) {
      checkRememberMeAndNavigateAppropriately();
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
                child: SvgPicture.asset("assets/images/top_left_illustration.svg"),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/images/top_right_illustration.svg"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset("assets/images/bottom_right_illustration.svg"),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SvgPicture.asset("assets/images/bottom_left_illustration.svg"),
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
                      child: SvgPicture.asset("assets/images/triangle_icon.svg"),
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
                        style: Theme.of(context).textTheme.headline2,
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
}
