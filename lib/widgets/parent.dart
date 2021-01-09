import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/copy_right_text.dart';
import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  final Widget child;
  final bool isCopyRightShow;
  final bool isPadding;
  final bool isScroll;
  final AppBar appBar;

  const Parent({
    Key key,
    this.child,
    this.isCopyRightShow = true,
    this.isPadding = true,
    this.isScroll = true,
    @required this.appBar,
  }) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.appBar,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Stack(
            children: [
              widget.isScroll
                  ? Container()
                  : widget.child.padding(
                      edgeInsets: EdgeInsets.all(
                        widget.isPadding ? dp16(context) : 0,
                      ),
                    ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: widget.isScroll
                    ? widget.child.padding(
                        edgeInsets: EdgeInsets.all(
                          widget.isPadding ? dp16(context) : 0,
                        ),
                      )
                    : Container(),
              ),
              Visibility(
                visible: widget.isCopyRightShow,
                child: Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: dp16(context), top: dp4(context)),
                      width: widthInPercent(100, context),
                      color: Colors.white,
                      child: CopyRightText()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
