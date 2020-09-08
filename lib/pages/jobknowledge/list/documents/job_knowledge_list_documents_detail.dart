import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/parent.dart';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListDocumentsDetail extends StatelessWidget {
  final String url;

  const JobKnowledgeListDocumentsDetail({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.logs(url);
    var height = heightInPercent(100, context) -
        (AppBar().preferredSize.height + dp20(context));
    print(height);
    return Parent(
      appBar: context.appBar(),
      child: PDF.network(
        url,
        width: widthInPercent(100, context),
        height: height,
      ),
    );
  }
}
