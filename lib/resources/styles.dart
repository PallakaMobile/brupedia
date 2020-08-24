import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static const TextStyle primaryBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: Palette.colorPrimary,
  );
  static const TextStyle primaryBoldDark = TextStyle(
    fontWeight: FontWeight.bold,
    color: Palette.colorPrimaryDark,
  );
  static const TextStyle primary = TextStyle(
    color: Palette.colorPrimary,
  );

  static const TextStyle white = TextStyle(
    color: Colors.white,
  );
  static const TextStyle whiteBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle text = TextStyle(
    color: Palette.colorText,
  );

  static const TextStyle textBold = TextStyle(
    color: Palette.colorText,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textAlt = TextStyle(
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

  static const BoxDecoration primary = BoxDecoration(
      gradient: Gradients.primary,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: [BoxShadows.primary]);

  static const BoxDecoration button = BoxDecoration(
      color: Palette.colorLink,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [BoxShadows.primary]);
}

class Gradients {
  static const LinearGradient primary = LinearGradient(
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
