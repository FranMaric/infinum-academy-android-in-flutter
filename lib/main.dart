import 'package:flutter/material.dart';
import 'constants/theme_data.dart';
import 'constants/routes.dart';

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
      initialRoute: splashScreenRoute,
      routes: routes,
    );
  }
}
