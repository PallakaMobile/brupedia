import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 27/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SearchLabel extends StatefulWidget {
  SearchLabel({
    Key key,
    @required this.label,
    @required this.onChanged,
  }) : super(key: key);
  final String label;
  final Function(String) onChanged;

  @override
  _SearchLabelState createState() => _SearchLabelState();
}

class _SearchLabelState extends State<SearchLabel> {
  bool _isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 85,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 350),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final inAnimation = Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);
                final outAnimation = Tween<Offset>(
                        begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);

                if (child.key == ValueKey("textF")) {
                  return ClipRect(
                    child: SlideTransition(
                      position: inAnimation,
                      child: child
                    ),
                  );
                } else {
                  return ClipRect(
                    child: SlideTransition(
                      position: outAnimation,
                      child: child
                    ),
                  );
                }
              },
              child: _isSearch
                  ? SizedBox(
                      key: ValueKey("textF"),
                      height: Dimens.searchLabel,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextF(
                          keyboardType: TextInputType.text,
                          hint: Strings.search,
                          onChanged: widget.onChanged,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    )
                  : SizedBox(
                      key: ValueKey("align"),
                      height: Dimens.searchLabel,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.label,
                          style: TextStyles.textBold.copyWith(
                            fontSize: Dimens.fontLarge,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
            )),
        Expanded(
          flex: 10,
          child: IconButton(
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 350),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final inAnimation = Tween<Offset>(
                        begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                    .animate(animation);
                final outAnimation = Tween<Offset>(
                        begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
                    .animate(animation);

                if (child.key == ValueKey("close")) {
                  return ClipRect(
                    child: SlideTransition(
                      position: inAnimation,
                      child: child,
                    ),
                  );
                } else {
                  return ClipRect(
                    child:
                        SlideTransition(position: outAnimation, child: child),
                  );
                }
              },
              child: _isSearch
                  ? Icon(
                      Icons.close,
                      key: ValueKey("close"),
                    )
                  : Icon(Icons.search, key: ValueKey("search")),
            ),
            onPressed: () {
              setState(() {
                _isSearch = !_isSearch;
              });
            },
          ),
        )
      ],
    );
  }
}
