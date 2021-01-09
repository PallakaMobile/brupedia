import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/pages/sop/sop.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SopListPage extends StatefulWidget {
  SopListPage({Key key, this.id, this.name}) : super(key: key);
  final String id;
  final String name;

  @override
  _SopListPageState createState() => _SopListPageState();
}

class _SopListPageState extends State<SopListPage> {
  var _listLabel = List<DataSelected>();
  var _listFragment = List<Widget>();

  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    _listLabel.add(DataSelected(
        title: Strings.all,
        isSelected: true,
        icon: "ic_list_all".toIconDictionary()));
    _listLabel.add(DataSelected(
        title: Strings.video,
        isSelected: false,
        icon: "ic_list_videos".toIconDictionary()));
    _listLabel.add(DataSelected(
        title: Strings.document,
        isSelected: false,
        icon: "ic_list_document".toIconDictionary()));
    _listFragment = [
      BlocProvider(
          create: (context) => SOPBloc(),
          child: SopListAll(
            idBidang: widget.id,
            name: widget.name,
          )),
      BlocProvider(
          create: (context) => SOPBloc(),
          child: SopListVideos(
            idBidang: widget.id,
            name: widget.name,
          )),
      BlocProvider(
          create: (context) => SOPBloc(),
          child: SopListDocuments(
            idBidang: widget.id,
            name: widget.name,
          )),
    ];
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
            CustomTab(
              listData: _listLabel,
              selectedColor: Palette.textSop,
              unSelectedColor: Palette.bgSop,
              selected: (int) {
                context.logs("selected $int");
                _pageController.jumpToPage(int);
              },
            ),
            SizedBox(
              height: dp8(context),
            ),
            Expanded(
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                onPageChanged: (int page) {
                  for (var item in _listLabel) {
                    setState(() {
                      if (_listLabel[page].title == item.title)
                        item.isSelected = true;
                      else
                        item.isSelected = false;
                    });
                  }
                },
                itemCount: _listFragment.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return _listFragment[index];
                },
              ),
            )
          ],
        ));
  }
}
