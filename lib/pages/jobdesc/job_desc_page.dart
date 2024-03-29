import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_bidang_response.dart';
import 'package:brupedia/pages/jobdesc/jobdesc.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class JobDescPage extends StatefulWidget {
  JobDescPage({Key key}) : super(key: key);

  @override
  _JobDescPageState createState() => _JobDescPageState();
}

class _JobDescPageState extends State<JobDescPage> {
  ListBidangBloc _listBidangBloc;

  var _listBidang = List<Data>();
  var _listBidangFilter = List<Data>();

  @override
  void initState() {
    super.initState();
    _listBidangBloc = BlocProvider.of<ListBidangBloc>(context);
    _listBidangBloc.add(GetListBidangEvent());
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
                ListBidangResponse _response = state.data;
                setState(() {
                  _listBidang = _response.data;
                  _listBidangFilter = _listBidang;
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
              label: Strings.jobDescription,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    _listBidangFilter = _listBidang
                        .where((element) => element.namaBidang
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  } else {
                    _listBidangFilter = _listBidang;
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
                child: Scrollbar(
                  child: _listBidangFilter.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: dp16(context),
                            mainAxisSpacing: dp16(context),
                            childAspectRatio: 2 / 1.65,
                          ),
                          itemCount: _listBidangFilter.length,
                          itemBuilder: (context, index) {
                            return MenuCard(
                                onPressed: () {
                                  context.goTo(BlocProvider(
                                    create: (context) => ListJabatanBloc(),
                                    child: JobDescListJabatanPage(
                                        namaBidang:
                                            _listBidangFilter[index].namaBidang,
                                        bidangId: _listBidangFilter[index]
                                            .id
                                            .toString()),
                                  ));
                                },
                                imageUrl: "ic_job_desc_alt".toIconDictionary(),
                                title: Strings.bidang,
                                subTitle: _listBidangFilter[index].namaBidang,
                                type: TypeMenu.JOB_DESC);
                          },
                        )
                      : Empty(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
