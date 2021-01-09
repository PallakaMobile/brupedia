import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_jabatan_response.dart';
import 'package:brupedia/pages/jobknowledge/jobknowledge.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';

class JobKnowledgeListJabatanPage extends StatefulWidget {
  JobKnowledgeListJabatanPage({Key key, this.bidangId, this.namaBidang})
      : super(key: key);
  final String bidangId;
  final String namaBidang;

  @override
  _JobKnowledgeListJabatanPageState createState() =>
      _JobKnowledgeListJabatanPageState();
}

class _JobKnowledgeListJabatanPageState
    extends State<JobKnowledgeListJabatanPage> {
  ListJabatanBloc _listBidangBloc;

  var _listJabatan = List<Data>();
  var _listJabatanFilter = List<Data>();

  @override
  void initState() {
    super.initState();
    var _params = Map<String, String>()..["bidangId"] = widget.bidangId;
    _listBidangBloc = BlocProvider.of<ListJabatanBloc>(context);
    _listBidangBloc.add(GetListJabatanEvent(_params));
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: BlocListener(
        cubit: _listBidangBloc,
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
                ListJabatanResponse _response = state.data;
                setState(() {
                  _listJabatan = _response.data;
                  _listJabatanFilter = _listJabatan;
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
            UserCard(),
            SizedBox(
              height: dp16(context),
            ),
            SearchLabel(
              label: "${Strings.bidang} ${widget.namaBidang}",
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    _listJabatanFilter = _listJabatan
                        .where((element) => element.namaJabatan
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  } else {
                    _listJabatanFilter = _listJabatan;
                  }
                });
              },
            ),
            SizedBox(
              height: dp16(context),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: dp24(context)),
                child: _listJabatanFilter.isNotEmpty
                    ? Scrollbar(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _listJabatanFilter.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.goTo(BlocProvider(
                                    create: (context) => JobKnowledgeBloc(),
                                    child: JobKnowledgeListPage(
                                      name:
                                          _listJabatanFilter[index].namaJabatan,
                                      id: _listJabatanFilter[index]
                                          .id
                                          .toString(),
                                    )));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Palette.bgJobKnowledge,
                                    child: SvgPicture.network(
                                      "ic_job_knowledge_list"
                                          .toIconDictionary(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: dp4(context),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _listJabatanFilter[index].namaJabatan,
                                      style: TextStyles.text,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: dp16(context),
                                  )
                                ],
                              ),
                            ).padding(
                                edgeInsets: EdgeInsets.symmetric(
                                    vertical: dp8(context)));
                          },
                        ),
                      )
                    : Empty(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
