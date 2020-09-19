import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../jobknowledge.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListPage extends StatefulWidget {
  JobKnowledgeListPage({Key key, this.id, this.name}) : super(key: key);
  final String id;
  final String name;

  @override
  _JobKnowledgeListPageState createState() => _JobKnowledgeListPageState();
}

class _JobKnowledgeListPageState extends State<JobKnowledgeListPage> {
  JobKnowledgeBloc _jobKnowledgeBloc;
  var _listLabel = List<DataSelected>();
  var _listFragment = List<Widget>();

  PageController _pageController = new PageController();
  var _video = "Link Video";
  var _document ="Dokumen";

  @override
  void initState() {
    super.initState();
    _jobKnowledgeBloc = BlocProvider.of<JobKnowledgeBloc>(context);
    var _params = Map<String, String>()..["jabatanId"] = widget.id;
    _jobKnowledgeBloc.add(GetJobKnowledgeEvent(_params));

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
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: BlocBuilder(
        cubit: _jobKnowledgeBloc,
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
                    .where((element) => element.type == _video)
                    .toList(growable: true);

                List<Data> _listDocument = _response.data
                    .where((element) => element.type == _document)
                    .toList(growable: true);
                _listFragment = [
                  JobKnowledgeListAll(
                    name: widget.name,
                    listMedia: _response.data,
                  ),
                  JobKnowledgeListVideos(
                    name: widget.name,
                    listMedia: _listVideo,
                  ),
                  JobKnowledgeListDocuments(
                      name: widget.name, listMedia: _listDocument),
                ];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTab(
                      listData: _listLabel,
                      selectedColor: Palette.textJobKnowledge,
                      unSelectedColor: Palette.bgJobKnowledge,
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
        },
      ),
    );
  }
}
