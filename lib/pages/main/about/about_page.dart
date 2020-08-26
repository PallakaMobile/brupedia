import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class AboutPage extends StatefulWidget with NavigationStates {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollViews(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.about,
          style: TextStyles.textBold,
        ),
        Text(
          Strings.programBrupedia,
          style: TextStyles.text,
        ),
        SizedBox(
          height: dp28(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "images/ic_pln_color.png",
              width: widthInPercent(40, context),
            ),
            Image.asset(
              "images/ic_brupedia_color.png",
              width: widthInPercent(40, context),
            )
          ],
        ),
        SizedBox(
          height: dp28(context),
        ),
        Text(
          Strings.askProgramBrupedia,
          style: TextStyles.textBold,
        ),
        SizedBox(
          height: dp8(context),
        ),
        Text(
          Strings.ansProgramBrupedia,
          style: TextStyles.text,
        ),
        SizedBox(
          height: dp28(context),
        ),
        Text(
          Strings.latarBelakang,
          style: TextStyles.textBold,
        ),
        SizedBox(
          height: dp8(context),
        ),
        Text(
          Strings.latarBelakangDesc,
          style: TextStyles.text,
        ),
        SizedBox(
          height: dp28(context),
        ),
        Text(
          Strings.strategy,
          style: TextStyles.textBold,
        ),
        SizedBox(
          height: dp8(context),
        ),
        Text(
          Strings.strategyDesc,
          style: TextStyles.text,
        ),
        SizedBox(
          height: dp28(context),
        ),
      ],
    ));
  }
}
