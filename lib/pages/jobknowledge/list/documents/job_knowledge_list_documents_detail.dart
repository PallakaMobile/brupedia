import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/parent.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListDocumentsDetail extends StatefulWidget {
  final String url;
  final String fileName;

  const JobKnowledgeListDocumentsDetail({Key key, this.url, this.fileName})
      : super(key: key);

  @override
  _JobKnowledgeListDocumentsDetailState createState() =>
      _JobKnowledgeListDocumentsDetailState();
}

class _JobKnowledgeListDocumentsDetailState
    extends State<JobKnowledgeListDocumentsDetail> {
  var _height = 0.0;

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.fileName ?? "",
            style: TextStyles.primaryBold.copyWith(fontSize: Dimens.fontLarge),
          ),
          Expanded(
            child: MeasureSize(
              onChange: (value) {
                setState(() {
                  _height = value.height;
                });
              },
              child: PDF.network(
                widget.url,
                width: widthInPercent(100, context),
                height: _height,
                placeHolder: Center(
                  child: Loading(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
