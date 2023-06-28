import 'package:flutter/material.dart';

const Color scColor = Color.fromRGBO(44, 56, 166, 1);
// const Color mainColor = Color(0xFFD6990A);
const Color mainColor = Color(0xFF67001a);

ThemeData highschoolThemeData = ThemeData(
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mainColor,
    secondary: Colors.white,
  ),
  // buttonTheme: const ButtonThemeData(
  //   textTheme: ButtonTextTheme.primary,
  //   buttonColor: mainColor,
  // ),
  // fontFamily: "SF-Pro-Text",
  // useMaterial3: true,
);
ThemeData middleschoolThemeData = ThemeData(
  primaryColor: scColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mainColor,
    secondary: Colors.white,
  ),
  // buttonTheme: const ButtonThemeData(
  //   textTheme: ButtonTextTheme.primary,
  //   buttonColor: mainColor,
  // ),
  // fontFamily: "SF-Pro-Text",
  // useMaterial3: true,
);
