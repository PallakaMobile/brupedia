import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/html_view.dart';
import 'package:brupedia/widgets/parent.dart';
import 'package:flutter/material.dart';

class TroubleshootingDetail extends StatelessWidget {
  final String data;

  const TroubleshootingDetail({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      child: HtmlView(
        htmlString: data,
      ),
    );
  }
}
