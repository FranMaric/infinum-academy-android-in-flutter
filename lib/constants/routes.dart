import 'package:flutter/widgets.dart';
import 'package:infinum_academy_android_flutter/ui/login_screen/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/splash_screen/splash_screen.dart';

final routes = <String, WidgetBuilder>{
  splashScreenRoute: (context) => const SplashScreen(),
  loginScreenRoute: (context) => const LoginScreen(),
};

const splashScreenRoute = '/';
const loginScreenRoute = '/login';
