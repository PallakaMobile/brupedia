import 'package:flutter/cupertino.dart';

class Dimens {
  static const double fontSmall = 12.0;
  static const double fontSmall1 = 10.0;
  static const double fontNormal = 14.0;
  static const double fontLarge = 16.0;
  static const double fontLarge1 = 18.0;
  static const double fontLarge2 = 20.0;
  static const double fontLarge3 = 26.0;
  static const double fontLarge4 = 32.0;
  static const double height8 = 55;
}

widthInPercent(double percent, BuildContext context) {
  var toDouble = percent / 100;
  return MediaQuery.of(context).size.width * toDouble;
}

heightInPercent(double percent, BuildContext context) {
  var toDouble = percent / 100;
  return MediaQuery.of(context).size.height * toDouble;
}

dp4(BuildContext context) {
  return MediaQuery.of(context).size.width / 100;
}

dp6(BuildContext context) {
  return MediaQuery.of(context).size.width / 70;
}

dp8(BuildContext context) {
  return MediaQuery.of(context).size.width / 54;
}

dp10(BuildContext context) {
  return MediaQuery.of(context).size.width / 41;
}

dp12(BuildContext context) {
  return MediaQuery.of(context).size.width / 34;
}

dp14(BuildContext context) {
  return MediaQuery.of(context).size.width / 29;
}

dp16(BuildContext context) {
  return MediaQuery.of(context).size.width / 26;
}

dp18(BuildContext context) {
  return MediaQuery.of(context).size.width / 23;
}

dp20(BuildContext context) {
  return MediaQuery.of(context).size.width / 20;
}

dp22(BuildContext context) {
  return MediaQuery.of(context).size.width / 17;
}

dp24(BuildContext context) {
  return MediaQuery.of(context).size.width / 16;
}

dp25(BuildContext context) {
  return MediaQuery.of(context).size.width / 15;
}

dp28(BuildContext context) {
  return MediaQuery.of(context).size.width / 12;
}

dp30(BuildContext context) {
  return MediaQuery.of(context).size.width / 10;
}

dp32(BuildContext context) {
  return MediaQuery.of(context).size.width / 8;
}

dp36(BuildContext context) {
  return MediaQuery.of(context).size.width / 6;
}
