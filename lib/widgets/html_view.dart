import 'package:brupedia/di/di.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class HtmlView extends StatelessWidget {
  final String htmlString;
  final Color color;

  const HtmlView({Key key, @required this.htmlString, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(data: htmlString.replaceAll("..", API.BASE_URL), style: {
      "body":
          Style(fontSize: FontSize.medium, color: color ?? Palette.colorText)
    }).margin(edgeInsets: EdgeInsets.only(bottom: dp20(context)));
    ;
  }
}
