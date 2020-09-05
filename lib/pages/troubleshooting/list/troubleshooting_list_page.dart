import 'package:brupedia/data/models/helper/DataTroubleshooting.dart';
import 'package:brupedia/pages/troubleshooting/detail/troubleshooting_detail.dart';
import 'package:brupedia/pages/troubleshooting/detailstep/troubleshooting_detail_step.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class TroubleshootingListPage extends StatefulWidget {
  TroubleshootingListPage({Key key}) : super(key: key);

  @override
  _TroubleshootingListPageState createState() =>
      _TroubleshootingListPageState();
}

class _TroubleshootingListPageState extends State<TroubleshootingListPage> {
  var _listTroubleshooting = List<DataTroubleshooting>();
  var _listTroubleshootingFilter = List<DataTroubleshooting>();

  @override
  void initState() {
    super.initState();
    for (int x = 0; x < 10; x++) {
      var _listContent = List<String>();
      for (int z = 0; z < 4; z++) {
        _listContent.add("List Content ${z + 1}");
      }
      _listTroubleshooting.add(DataTroubleshooting(
          title: "Troubleshooting ${x + 1}",
          content: "Ini isi kontent",
          listContent: _listContent));
    }
    _listTroubleshootingFilter = _listTroubleshooting;
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchLabel(
            label: Strings.permasalahan + " " + Strings.andTroubleShooting,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _listTroubleshootingFilter = _listTroubleshooting
                    .where((element) => element.title
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              } else {
                _listTroubleshootingFilter = _listTroubleshooting;
              }

              //reset isVisible every search item
              _listTroubleshootingFilter.forEach((element) {
                setState(() {
                  element.isVisible = false;
                });
              });
            },
          ),
          SizedBox(
            height: dp16(context),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: dp24(context)),
              child: Scrollbar(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: _listTroubleshootingFilter.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(dp8(context)),
                        margin: EdgeInsets.symmetric(vertical: dp4(context)),
                        decoration: BoxDecoration(
                            color: Palette.bgListTroubleshooting,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    flex: 80,
                                    child: Text(
                                      _listTroubleshootingFilter[index].title,
                                      style: TextStyles.whiteBold,
                                    )),
                                Expanded(
                                    flex: 15,
                                    child: FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          _listTroubleshootingFilter[index]
                                                  .isVisible =
                                              !_listTroubleshootingFilter[index]
                                                  .isVisible;
                                        });
                                      },
                                      padding: EdgeInsets.zero,
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.network(
                                            "ic_trouble_fix".toIconDictionary(),
                                            height: dp16(context),
                                          ),
                                          Text(
                                            _listTroubleshootingFilter[index]
                                                .listContent
                                                .length
                                                .toString(),
                                            style: TextStyles.whiteBold,
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            Text(
                              _listTroubleshootingFilter[index].content,
                              style: TextStyles.white,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                  onPressed: () {
                                    context.goTo(TroubleshootingDetail());
                                  },
                                  child: Text(
                                    "Read More",
                                    style: TextStyles.text
                                        .copyWith(color: Colors.orange),
                                  )),
                            )
                          ],
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: _listTroubleshootingFilter[index].isVisible
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _listTroubleshootingFilter[index]
                                    .listContent
                                    .length,
                                itemBuilder: (_, indexContent) {
                                  return Container(
                                    padding: EdgeInsets.all(dp8(context)),
                                    margin: EdgeInsets.symmetric(
                                        vertical: dp4(context)),
                                    decoration: BoxDecoration(
                                        color: Palette.bgTrouble,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _listTroubleshootingFilter[index]
                                              .listContent[indexContent],
                                          style: TextStyles.text,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: FlatButton(
                                              onPressed: () {
                                                context.goTo(
                                                    TroubleshootingDetailStep());
                                              },
                                              child: Text(
                                                "Read More",
                                                style: TextStyles.text.copyWith(
                                                    color: Colors.orange),
                                              )),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            : Container(),
                      )
                    ],
                  );
                },
              )),
            ),
          ),
        ],
      ),
    );
  }
}
