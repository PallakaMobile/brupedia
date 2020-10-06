import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved

enum TypeMenu { JOB_DESC, SOP, JOB_KNOW, TROUBLE }

class MenuCard extends StatelessWidget {
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String subTitle;
  final TypeMenu type;

  const MenuCard({
    Key key,
    @required this.onPressed,
    @required this.imageUrl,
    @required this.title,
    @required this.subTitle,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _bgColor;
    Color _textColor;

    switch (type) {
      case TypeMenu.JOB_DESC:
        _bgColor = Palette.bgJobDesc;
        _textColor = Palette.textJobDesc;
        break;
      case TypeMenu.SOP:
        _bgColor = Palette.bgSop;
        _textColor = Palette.textSop;
        break;
      case TypeMenu.JOB_KNOW:
        _bgColor = Palette.bgJobKnowledge;
        _textColor = Palette.textJobKnowledge;
        break;
      case TypeMenu.TROUBLE:
        _bgColor = Palette.bgTrouble;
        _textColor = Palette.textTrouble;
        break;
    }

    return FlatButton(
      splashColor: Palette.colorHint,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      color: _bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(dp14(context)),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              imageUrl,
              height: 42.h,
            ),
            SizedBox(
              height: dp14(context),
            ),
            Text(
              title,
              style: TextStyle(color: _textColor, fontSize: Dimens.fontNormal),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: _textColor,
                fontSize: Dimens.fontNormal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
