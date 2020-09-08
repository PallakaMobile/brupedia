import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

///*********************************************
/// Created by ukietux on 08/09/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class HtmlView extends StatelessWidget {
  final String htmlString;

  const HtmlView({Key key, @required this.htmlString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
            data: htmlString, style: {"body": Style(fontSize: FontSize.small)})
        .margin(edgeInsets: EdgeInsets.only(bottom: dp20(context)));
    ;
  }
}
