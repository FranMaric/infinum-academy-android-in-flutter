import 'package:flutter/material.dart';

final themeData = ThemeData(
  primaryColor: const Color(0xFF52368C),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  backgroundColor: const Color(0xFF3D1D72),
  focusColor: const Color(0xFFFFFFFF),
  hoverColor: const Color(0xFFFFFFFF),
  unselectedWidgetColor: Colors.white,
  textTheme: const TextTheme(
    /// Used for AppBar text
    headline6: TextStyle(
      fontSize: 34.0,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.37,
    ),

    /// Used for [ShowTile] title
    subtitle1: TextStyle(
      fontSize: 20.0,
      color: Color(0xDD000000),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),

    /// Used for [ShowTile] description
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Color(0x99000000),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),

    /// Used for email text in [ProfileBottomSheet]
    caption: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.19,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff00adb5),
    disabledColor: Color(0xFFFFFFFF),
  ),
);
