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
class SopListDocumentsDetail extends StatelessWidget {
  final String url;
  final String fileName;

  const SopListDocumentsDetail({Key key, this.url, this.fileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = heightInPercent(100, context) -
        (AppBar().preferredSize.height + dp20(context));
    print(height);
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            fileName ?? "",
            style: TextStyles.primaryBold.copyWith(fontSize: Dimens.fontLarge),
          ),
          Expanded(
            child: PDF.network(
              url,
              width: widthInPercent(100, context),
              placeHolder: Center(
                child: Loading(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
