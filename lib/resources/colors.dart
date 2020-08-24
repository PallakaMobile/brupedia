import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';

class Palette {
  static const Color colorPrimary = Color(0xff001687);
  static const Color colorPrimaryDark = Color(0xff2fad4f);
  static const Color colorAccent = colorPrimary;
  static const Color colorBackground = Colors.white;
  static const Color colorText = Color(0xff34395E);
  static const Color colorTextAlt = Color(0xff909090);
  static const Color colorHint = Color(0xffFDFDFF);
  static const Color colorLink = Color(0xff2546F2);
}

ThemeData themeDefault = ThemeData(
  fontFamily: 'Poppins',
  backgroundColor: Palette.colorBackground,
  primaryColor: Palette.colorPrimary,
  accentColor: Palette.colorAccent,
  cursorColor: Palette.colorAccent,
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Palette.colorText,
    displayColor: Palette.colorText,
  ),
  scaffoldBackgroundColor: Palette.colorBackground,
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
    elevation: 10,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: Dimens.fontLarge1)),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
