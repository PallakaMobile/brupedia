import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SopListVideosDetail extends StatefulWidget {
  SopListVideosDetail({Key key}) : super(key: key);

  @override
  _SopListVideosDetailState createState() => _SopListVideosDetailState();
}

class _SopListVideosDetailState extends State<SopListVideosDetail> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      child: Center(
        child: Text("Video Player"),
      ),
    );
  }
}
