import 'package:flutter/material.dart';

class Palette {
  static const Color colorPrimary = Color(0xff001687);
  static const Color colorPrimaryDark = Color(0xff001687);
  static const Color colorAccent = colorPrimary;
  static const Color colorBackground = Colors.white;
  static const Color colorText = Color(0xff34395E);
  static const Color colorTextAlt = Color(0xff909090);
  static const Color colorHint = Color(0xffFDFDFF);
  static const Color colorLink = Color(0xff2546F2);

  static const Color bgJobDesc = Color(0xffE7F6FF);
  static const Color bgSop = Color(0xffECEFFF);
  static const Color bgJobKnowledge = Color(0xffE7FFFD);
  static const Color bgTrouble = Color(0xffFFF7E0);

  static const Color textJobDesc = Color(0xff1154C2);
  static const Color textSop = Color(0xff5C61DF);
  static const Color textJobKnowledge = Color(0xff0D9596);
  static const Color textTrouble = Color(0xffFFA216);
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
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
