import 'package:flutter/material.dart';

const Color mainColor = Color.fromRGBO(44, 56, 166, 1);
const Color secondaryColor = Color(0xFF67001a);

ThemeData highschoolThemeData = ThemeData(
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mainColor,
    secondary: Colors.white,
  ),
  appBarTheme: AppBarTheme(backgroundColor: mainColor,
   titleTextStyle: TextStyle(fontFamily: "SF-Pro-Text", fontWeight: FontWeight.bold, fontSize: 16)
  ),
  iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)))
  // buttonTheme: const ButtonThemeData(
  //   textTheme: ButtonTextTheme.primary,
  //   buttonColor: mainColor,
  // ),
  // fontFamily: "SF-Pro-Text",
  // useMaterial3: true,
);
ThemeData middleschoolThemeData = ThemeData(
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
