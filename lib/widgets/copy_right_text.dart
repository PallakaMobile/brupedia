import 'package:brupedia/resources/colors.dart';
import 'package:brupedia/resources/dimens.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
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
          "Copyright © 2020",
          style: TextStyle(color: color ?? Palette.colorText),
        ),
        SizedBox(width: dp8(context),),
        Text(
          "PLTU Barru OMU",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: color ?? Palette.colorText),
        )
      ],
    );
  }
}