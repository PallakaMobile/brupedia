import 'package:brupedia/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLink extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final Color titleColor;

  const ButtonLink(
      {Key key, this.title, this.onPressed, this.color, this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(0.0),
        child: Text(
          title,
          style: TextStyle(
              color: titleColor ?? Palette.colorLink,
              fontSize: Dimens.fontNormal,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ));
  }
}
