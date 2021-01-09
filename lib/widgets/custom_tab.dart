import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTab extends StatefulWidget {
  CustomTab({
    Key key,
    this.selectedColor,
    this.unSelectedColor,
    this.listData,
    this.selected,
  }) : super(key: key);
  final Color selectedColor;
  final Color unSelectedColor;
  final List<DataSelected> listData;
  final Function(int) selected;

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50.h,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.listData.map(
            (data) {
              var _isSelected = data.isSelected;
              return Container(
                width: widthInPercent(90, context) / widget.listData.length - 1,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  onPressed: () {
                    widget.selected(widget.listData.indexOf(data));
                    for (var item in widget.listData) {
                      setState(() {
                        if (data.title == item.title) {
                          item.isSelected = true;
                        } else
                          item.isSelected = false;
                      });
                    }
                  },
                  color: _isSelected
                      ? widget.selectedColor
                      : widget.unSelectedColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        data.icon,
                        height: dp16(context),
                        color:
                            _isSelected ? Colors.white : widget.selectedColor,
                      ),
                      SizedBox(
                        width: dp8(context),
                      ),
                      Text(
                        data.title,
                        style: TextStyles.white.copyWith(
                            fontSize: Dimens.fontSmall,
                            color: _isSelected
                                ? Colors.white
                                : widget.selectedColor),
                      )
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ));
  }
}
