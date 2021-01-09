import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Empty extends StatelessWidget {
  final String errorMessage;

  const Empty({Key key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.network(
            "ic_empty".toIconDictionary(),
          ),
          Text(
            Strings.dataKosong,
            style: TextStyles.textAlt,
          )
        ],
      ),
    );
  }
}
