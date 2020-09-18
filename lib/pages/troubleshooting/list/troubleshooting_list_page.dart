import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_troubleshoot.dart';
import 'package:brupedia/pages/troubleshooting/detail/troubleshooting_detail.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class TroubleshootingListPage extends StatefulWidget {
  TroubleshootingListPage({Key key, this.bidangId}) : super(key: key);
  final String bidangId;

  @override
  _TroubleshootingListPageState createState() =>
      _TroubleshootingListPageState();
}

class _TroubleshootingListPageState extends State<TroubleshootingListPage> {
  TroubleshootBloc _troubleshootBloc;
  var _listTroubleshooting = List<Data>();
  var _listTroubleshootingFilter = List<Data>();

  @override
  void initState() {
    super.initState();
    var _params = Map<String, String>()..["bidangId"] = widget.bidangId;
    _troubleshootBloc = BlocProvider.of<TroubleshootBloc>(context);
    _troubleshootBloc.add(GetTroubleshootEvent(_params));
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: BlocListener(
        cubit: _troubleshootBloc,
        listener: (_, state) {
          switch (state.status) {
            case Status.LOADING:
              {
                Strings.harapTunggu.toToastLoading();
              }
              break;
            case Status.ERROR:
              {
                dismissAllToast(showAnim: true);
                state.message.toString().toToastError();
              }
              break;
            case Status.SUCCESS:
              {
                dismissAllToast(showAnim: true);
                ListTroubleshoot _response = state.data;
                setState(() {
                  _listTroubleshooting = _response.data;
                  _listTroubleshootingFilter = _listTroubleshooting;
                });
              }
              break;
            default:
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SearchLabel(
              label: Strings.permasalahan + " " + Strings.andTroubleShooting,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    _listTroubleshootingFilter = _listTroubleshooting
                        .where((element) => element.judul
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
                });
              },
            ),
            SizedBox(
              height: dp16(context),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: dp24(context)),
                child: _listTroubleshootingFilter.isNotEmpty
                    ? Scrollbar(
                        child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _listTroubleshootingFilter.length,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(dp8(context)),
                                margin: EdgeInsets.symmetric(
                                    vertical: dp4(context)),
                                decoration: BoxDecoration(
                                    color: Palette.bgListTroubleshooting,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            flex: 80,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _listTroubleshootingFilter[
                                                          index]
                                                      .judul,
                                                  style: TextStyles.whiteBold,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.white,
                                                      size: dp16(context),
                                                    ),
                                                    SizedBox(
                                                      width: dp4(context),
                                                    ),
                                                    Text(
                                                      _listTroubleshootingFilter[
                                                              index]
                                                          .createdAt
                                                          .toDate(),
                                                      style: TextStyles.white
                                                          .copyWith(
                                                              fontSize: Dimens
                                                                  .fontSmall),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 15,
                                            child: FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  _listTroubleshootingFilter[
                                                              index]
                                                          .isVisible =
                                                      !_listTroubleshootingFilter[
                                                              index]
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.network(
                                                    "ic_trouble_fix"
                                                        .toIconDictionary(),
                                                    height: dp16(context),
                                                  ),
                                                  Text(
                                                    _listTroubleshootingFilter[
                                                            index]
                                                        .dataTindakan
                                                        .length
                                                        .toString(),
                                                    style: TextStyles.whiteBold,
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    HtmlView(
                                      htmlString:
                                          _listTroubleshootingFilter[index]
                                              .summary,
                                      color: Colors.white,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                          onPressed: () {
                                            context.goTo(TroubleshootingDetail(
                                              data: _listTroubleshootingFilter[
                                                      index]
                                                  .deskripsi,
                                            ));
                                          },
                                          child: Text(
                                            Strings.readMore,
                                            style: TextStyles.text
                                                .copyWith(color: Colors.orange),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: _listTroubleshootingFilter[index]
                                        .isVisible
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            _listTroubleshootingFilter[index]
                                                .dataTindakan
                                                .length,
                                        itemBuilder: (_, indexContent) {
                                          return Container(
                                            padding:
                                                EdgeInsets.all(dp8(context)),
                                            margin: EdgeInsets.symmetric(
                                                vertical: dp4(context)),
                                            decoration: BoxDecoration(
                                                color: Palette.bgTrouble,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      _listTroubleshootingFilter[
                                                              index]
                                                          .dataTindakan[
                                                              indexContent]
                                                          .judul,
                                                      style: TextStyles.text,
                                                    ),
                                                    Spacer(),
                                                    SvgPicture.network(
                                                        _listTroubleshootingFilter[
                                                                        index]
                                                                    .dataTindakan[
                                                                        indexContent]
                                                                    .status ==
                                                                1
                                                            ? "ic_check"
                                                                .toIconDictionary()
                                                            : "ic_uncheck"
                                                                .toIconDictionary()),
                                                    SizedBox(
                                                      width: dp4(context),
                                                    ),
                                                    Text(
                                                      _listTroubleshootingFilter[
                                                                      index]
                                                                  .dataTindakan[
                                                                      indexContent]
                                                                  .status ==
                                                              1
                                                          ? "selesai"
                                                              .toTextDictionary()
                                                          : "belum"
                                                              .toTextDictionary(),
                                                      style: TextStyles.primary
                                                          .copyWith(
                                                              fontSize: Dimens
                                                                  .fontSmall),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      color:
                                                          Palette.colorPrimary,
                                                      size: dp16(context),
                                                    ),
                                                    SizedBox(
                                                      width: dp4(context),
                                                    ),
                                                    Text(
                                                      _listTroubleshootingFilter[
                                                              index]
                                                          .dataTindakan[
                                                              indexContent]
                                                          .tglTindakan,
                                                      style: TextStyles.primary
                                                          .copyWith(
                                                              fontSize: Dimens
                                                                  .fontSmall),
                                                    )
                                                  ],
                                                ),
                                                HtmlView(
                                                  htmlString:
                                                      _listTroubleshootingFilter[
                                                              index]
                                                          .dataTindakan[
                                                              indexContent]
                                                          .summary,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: FlatButton(
                                                      onPressed: () {
                                                        context.goTo(
                                                            TroubleshootingDetail(
                                                          data: _listTroubleshootingFilter[
                                                                  index]
                                                              .dataTindakan[
                                                                  indexContent]
                                                              .deskripsi,
                                                        ));
                                                      },
                                                      child: Text(
                                                        Strings.readMore,
                                                        style: TextStyles.text
                                                            .copyWith(
                                                                color: Colors
                                                                    .orange),
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
                      ))
                    : Empty(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
