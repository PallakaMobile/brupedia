import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/copy_right_text.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class ScrollViews extends StatefulWidget {
  final Widget child;
  final bool isCopyRightShow;
  final bool isPadding;

  const ScrollViews({
    Key key,
    this.child,
    this.isCopyRightShow = true,
    this.isPadding = true,
  }) : super(key: key);

  @override
  _ScrollViewsState createState() => _ScrollViewsState();
}

class _ScrollViewsState extends State<ScrollViews> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: widget.child.padding(
            edgeInsets: EdgeInsets.all(
              widget.isPadding ? dp16(context) : 0,
            ),
          ),
        ),
        Visibility(
          visible: widget.isCopyRightShow,
          child: Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(bottom: dp16(context),top: dp4(context)),
                width: widthInPercent(100, context),
                color: Colors.white,
                child: CopyRightText()),
          ),
        )
      ],
    );
  }
}
