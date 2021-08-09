import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/screens/splash_screen.dart';
import 'package:infinum_academy_android_flutter/values/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shows',
      theme: themeData,
      home: const SplashScreen(),
    );
  }
}
