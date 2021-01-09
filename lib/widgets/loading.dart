import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/widgets/color_loaders.dart';
import 'package:flutter/material.dart';

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
