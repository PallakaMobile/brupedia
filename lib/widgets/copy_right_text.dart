import 'package:brupedia/resources/colors.dart';
import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';

class CopyRightText extends StatelessWidget {
  final Color color;

  const CopyRightText({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.copyRight,
          style: TextStyle(
              color: color ?? Palette.colorText, fontSize: Dimens.fontSmall),
        ),
        SizedBox(
          width: dp8(context),
        ),
        Text(
          Strings.namePLTU,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color ?? Palette.colorText,
              fontSize: Dimens.fontSmall),
        )
      ],
    );
  }
}
