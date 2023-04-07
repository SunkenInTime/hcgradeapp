import 'package:flutter/material.dart';

const Color mainColor = Color.fromRGBO(44, 56, 166, 1);
ThemeData themeData = ThemeData(
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mainColor,
    secondary: Colors.white,
  ),
  // buttonTheme: const ButtonThemeData(
  //   textTheme: ButtonTextTheme.primary,
  //   buttonColor: mainColor,
  // ),
);
