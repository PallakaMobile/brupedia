import 'package:brupedia/utils/utils.dart';
import 'package:flutter/material.dart';

class Palette {
  static Color colorPrimary =
      "colorPrimary".toColorDictionary() ?? Color(0xff001687);
  static Color colorPrimaryDark = "colorPrimaryDark".toColorDictionary();
  static Color colorAccent = "colorAccent".toColorDictionary();
  static Color colorBackground = "colorBackground".toColorDictionary();
  static Color colorText = "colorText".toColorDictionary() ?? Color(0xff34395E);
  static Color colorTextAlt = "colorTextAlt".toColorDictionary();
  static Color colorHint = "colorHint".toColorDictionary();
  static Color colorLink = "colorLink".toColorDictionary();
  static Color bgJobDesc = "bgJobDesc".toColorDictionary();
  static Color bgSop = "bgSop".toColorDictionary();
  static Color bgJobKnowledge = "bgJobKnowledge".toColorDictionary();
  static Color bgTrouble = "bgTrouble".toColorDictionary();
  static Color textJobDesc = "textJobDesc".toColorDictionary();
  static Color textSop = "textSop".toColorDictionary();
  static Color textJobKnowledge = "textJobKnowledge".toColorDictionary();
  static Color textTrouble = "textTrouble".toColorDictionary();
  static Color bgListTroubleshooting =
      "bgListTroubleshooting".toColorDictionary();
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
