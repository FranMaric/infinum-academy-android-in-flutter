import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shows',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}
