import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static TextStyle primaryBold = TextStyle(
    fontSize: Dimens.fontNormal,
    fontWeight: FontWeight.bold,
    color: Palette.colorPrimary,
  );
  static TextStyle primaryBoldDark = TextStyle(
    fontSize: Dimens.fontNormal,
    fontWeight: FontWeight.bold,
    color: Palette.colorPrimaryDark,
  );
  static TextStyle primary = TextStyle(
    fontSize: Dimens.fontNormal,
    color: Palette.colorPrimary,
  );

  static TextStyle white = TextStyle(
    fontSize: Dimens.fontNormal,
    color: Colors.white,
  );
  static TextStyle whiteBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fontNormal,
    color: Colors.white,
  );
  static TextStyle text = TextStyle(
    fontSize: Dimens.fontNormal,
    color: Palette.colorText,
  );

  static TextStyle textBold = TextStyle(
    color: Palette.colorText,
    fontSize: Dimens.fontNormal,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textAlt = TextStyle(
    fontSize: Dimens.fontNormal,
    color: Palette.colorTextAlt,
  );
}

class BoxDecorations {
  static const BoxDecoration white = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      boxShadow: [BoxShadows.primary]);

  static BoxDecoration primary = BoxDecoration(
      gradient: Gradients.primary,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: [BoxShadows.primary]);

  static BoxDecoration button = BoxDecoration(
      color: Palette.colorLink,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [BoxShadows.primary]);
}

class Gradients {
  static LinearGradient primary = LinearGradient(
    // Where the linear gradient begins and ends
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Palette.colorPrimary,
      Palette.colorPrimaryDark,
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Colors.black,
      Colors.black87,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class BoxShadows {
  static const BoxShadow primary = BoxShadow(
    color: Colors.black12,
    offset: const Offset(1.0, 2.0),
    blurRadius: 1.0,
    spreadRadius: 1.0,
  );
}
