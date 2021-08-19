import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinum_academy_android_flutter/ui/login_screen/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/register_screen/register_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/shows_screen.dart';
import 'package:infinum_academy_android_flutter/ui/splash_screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LoginScreen.routeName:
        if (args == null) {
          return MaterialPageRoute(builder: (_) => const LoginScreen());
        }
        if (args is bool) {
          return MaterialPageRoute(
              builder: (_) => LoginScreen(isFromRegister: args));
        }
        return _errorRoute();
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ShowsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ShowsScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('ROUTING ERROR'),
        ),
      ),
    );
  }
}
