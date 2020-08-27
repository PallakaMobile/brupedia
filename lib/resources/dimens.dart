import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  static double fontSmall = 12.sp;
  static double fontSmall1 = 10.0.sp;
  static double fontNormal = 14.0.sp;
  static double fontLarge = 16.0.sp;
  static double fontLarge1 = 18.0.sp;
  static double fontLarge2 = 20.0.sp;
  static double fontLarge3 = 26.0.sp;
  static double fontLarge4 = 32.0.sp;
  static double height8 = 55.h;
  static double height50 = 380.h;
  static double height40 = 274.h;
  static double height35 = 200.h;
  static double height30 = 177.h;
  static double header = 150.h;
  static double searchLabel = 60.h;
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
