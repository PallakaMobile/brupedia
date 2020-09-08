import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/color_loaders.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 25/06/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorLoader(),
        Text(
          Strings.harapTunggu,
          style: TextStyles.text,
        )
      ],
    );
  }
}
