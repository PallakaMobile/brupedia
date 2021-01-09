import 'package:brupedia/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double width;
  final double height;
  final Color color;
  final Color titleColor;
  final double fontSize;

  const Button(
      {Key key,
      this.title,
      this.onPressed,
      this.width,
      this.height,
      this.color,
      this.titleColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? widthInPercent(100, context),
      height: height ?? 40.w,
      decoration:
          BoxDecorations.button.copyWith(color: color ?? Palette.colorPrimary),
      child: FlatButton(
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          child: Text(
            title,
            style: TextStyle(
                color: titleColor ?? Colors.white,
                fontSize: fontSize ?? Dimens.fontLarge1,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )),
    );
  }
}
