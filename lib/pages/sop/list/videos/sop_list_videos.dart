import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../sop.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SopListVideos extends StatefulWidget {
  SopListVideos({Key key, this.idBidang, this.name}) : super(key: key);
  final String idBidang;
  final String name;

  @override
  _SopListVideosState createState() => _SopListVideosState();
}

class _SopListVideosState extends State<SopListVideos> {
  var _listMediaFilter = List<Data>();
  SOPBloc _sopBloc;
  int _currentPage = 0;
  int _lastPage = 1;
  String _query = "";
  ScrollController _scrollController = new ScrollController();

  var _video = "Link Video";

  @override
  void initState() {
    super.initState();
    _sopBloc = BlocProvider.of<SOPBloc>(context);
    _getMedia();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMedia();
      }
    });
  }

  _getMedia() {
    context.logs("currentPage $_currentPage <=> lastPage $_lastPage");
    context.logs("check ${_currentPage < _lastPage}");
    if (_currentPage < _lastPage) {
      _currentPage++;
      var _params = Map<String, String>()
        ..["bidangId"] = widget.idBidang
        ..["q"] = _query
        ..["category"] = "video"
        ..["page"] = _currentPage.toString();

      _sopBloc.add(GetSOPEvent(_params, _currentPage == 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SearchLabel(
          label: "${widget.name}  - ${Strings.video}",
          onChanged: (value) {
            _query = value;
            //reset current page and last page
            _currentPage = 0;
            _lastPage = 1;
            _getMedia();
          },
        ),
        Expanded(
          child: BlocBuilder(
            cubit: _sopBloc,
            builder: (_, state) {
              switch (state.status) {
                case Status.LOADING:
                  return Center(child: Loading());
                  break;
                case Status.ERROR:
                  return Center(child: Empty());
                  break;
                case Status.SUCCESS:
                  {
                    context.logs("Data Loaded in page $_currentPage");
                    //clear data if first load
                    if (_currentPage == 1) _listMediaFilter.clear();
                    MediaResponse _response = state.data;
                    _listMediaFilter.addAll(_response.data);
                    _lastPage = _response.lastPage;

                    context.logs(
                        "currentPage $_currentPage <=> lastPage $_lastPage");
                    return Container(
                      padding: EdgeInsets.only(bottom: dp24(context)),
                      child: _listMediaFilter.isNotEmpty
                          ? Scrollbar(
                              child: ListView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemCount: _currentPage == _lastPage
                                    ? _listMediaFilter.length
                                    : _listMediaFilter.length + 1,
                                itemBuilder: (context, index) {
                                  return index < _listMediaFilter.length
                                      ? InkWell(
                                          onTap: () {
                                            context.goTo(SopListVideosDetail(
                                              fileName:
                                                  _listMediaFilter[index].nama,
                                              url: _listMediaFilter[index].link,
                                            ));
                                          },
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Palette.bgSop,
                                                child: SvgPicture.network(
                                                  "ic_list_videos"
                                                      .toIconDictionary(),
                                                  height: dp16(context),
                                                  color: Palette.textSop,
                                                ),
                                              ),
                                              SizedBox(
                                                width: dp4(context),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _listMediaFilter[index]
                                                            .nama ??
                                                        "Untitled",
                                                    style: TextStyles.text,
                                                  ),
                                                  Text(
                                                    _listMediaFilter[index]
                                                        .updatedAt
                                                        .toDate(),
                                                    style: TextStyles.textAlt
                                                        .copyWith(
                                                            fontSize: Dimens
                                                                .fontSmall),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ).padding(
                                          edgeInsets: EdgeInsets.symmetric(
                                              vertical: dp8(context)))
                                      : Container(
                                          height: 50,
                                          child: Center(
                                            child:
                                                new CircularProgressIndicator(),
                                          ),
                                        );
                                },
                              ),
                            )
                          : Empty(),
                    );
                  }
                  break;
                default:
                  return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
