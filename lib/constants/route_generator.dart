import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/ui/login/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/register/register_screen.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/show_details_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/shows_screen.dart';
import 'package:infinum_academy_android_flutter/ui/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case LoginScreen.routeName:
      if (args == null) {
        return MaterialPageRoute(builder: (_) => LoginScreen());
      }
      if (args is bool) {
        return MaterialPageRoute(builder: (_) => LoginScreen(isFromRegister: args));
      }
      return _errorRoute();
    case RegisterScreen.routeName:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case ShowsScreen.routeName:
      return MaterialPageRoute(builder: (_) => const ShowsScreen());
    case ShowDetailsScreen.routeName:
      if (args is Show) {
        return MaterialPageRoute(builder: (_) => ShowDetailsScreen(show: args));
      }
      return _errorRoute();
    default:
      return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) => const Scaffold(
      body: Center(
        child: Text('ROUTING ERROR'),
      ),
    ),
  );
}
