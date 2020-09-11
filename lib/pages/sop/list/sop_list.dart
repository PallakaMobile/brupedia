import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/pages/sop/sop.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SopListPage extends StatefulWidget {
  SopListPage({Key key, this.id, this.name}) : super(key: key);
  final String id;
  final String name;

  @override
  _SopListPageState createState() => _SopListPageState();
}

class _SopListPageState extends State<SopListPage> {
  SOPBloc _sopBloc;
  var _listLabel = List<DataSelected>();
  var _listFragment = List<Widget>();

  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    _sopBloc = BlocProvider.of<SOPBloc>(context);
    var _params = Map<String, String>()..["bidangId"] = widget.id;
    _sopBloc.add(GetSOPEvent(_params));

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
      SopListAll(),
      SopListVideos(),
      SopListDocuments(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
        appBar: context.appBar(),
        isScroll: false,
        child: BlocBuilder(
            cubit: _sopBloc,
            builder: (_, state) {
              switch (state.status) {
                case Status.LOADING:
                  {
                    return Center(child: Loading());
                  }
                  break;
                case Status.ERROR:
                  {
                    return Center(child: Empty());
                  }
                  break;
                case Status.SUCCESS:
                  {
                    MediaResponse _response = state.data;

                    var _listVideo = _response.data
                        .where((element) => element.type == "url")
                        .toList(growable: true);

                    List<Data> _listDocument = _response.data
                        .where((element) => element.type == "file")
                        .toList(growable: true);
                    _listFragment = [
                      SopListAll(
                        name: widget.name,
                        listMedia: _response.data,
                      ),
                      SopListVideos(
                        name: widget.name,
                        listMedia: _listVideo,
                      ),
                      SopListDocuments(
                        name: widget.name,
                        listMedia: _listDocument,
                      ),
                    ];

                    return Column(
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
                    );
                  }
                  break;
                default:
                  return Container();
              }
            }));
  }
}
