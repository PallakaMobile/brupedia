import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/pages/jobknowledge/jobknowledge.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobKnowledgeListAll extends StatefulWidget {
  JobKnowledgeListAll({Key key, this.listMedia, this.name}) : super(key: key);
  final List<Data> listMedia;
  final String name;

  @override
  _JobKnowledgeListAllState createState() => _JobKnowledgeListAllState();
}

class _JobKnowledgeListAllState extends State<JobKnowledgeListAll> {
  var _listMediaFilter = List<Data>();

  var _video = "Link Video";
  var _document = "Dokumen";

  @override
  void initState() {
    super.initState();
    _listMediaFilter = widget.listMedia;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SearchLabel(
          label: "${widget.name} - ${Strings.all}",
          onChanged: (value) {
            try {
              setState(() {
                if (value.isNotEmpty) {
                  _listMediaFilter = widget.listMedia
                      .where((element) => element.nama
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                  context.logs("filtered $_listMediaFilter");
                } else {
                  _listMediaFilter = widget.listMedia;
                }
              });
            } catch (e) {
              context.logs(e);
            }
          },
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: dp24(context)),
            child: _listMediaFilter.isNotEmpty
                ? Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _listMediaFilter.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (_listMediaFilter[index].type == _video) {
                              context.goTo(JobKnowledgeListVideosDetail(
                                fileName: _listMediaFilter[index].nama,
                                url: _listMediaFilter[index].url,
                              ));
                            } else {
                              context.goTo(JobKnowledgeListDocumentsDetail(
                                fileName: _listMediaFilter[index].nama,
                                url: _listMediaFilter[index].url,
                              ));
                            }
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Palette.bgJobKnowledge,
                                child: SvgPicture.network(
                                  _listMediaFilter[index].type == _video
                                      ? "ic_list_videos".toIconDictionary()
                                      : "ic_list_document".toIconDictionary(),
                                  height: dp16(context),
                                ),
                              ),
                              SizedBox(
                                width: dp8(context),
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _listMediaFilter[index].nama ??
                                          "Untitled",
                                      style: TextStyles.text,
                                    ),
                                    Text(
                                      _listMediaFilter[index]
                                          .updatedAt
                                          .toDate(),
                                      style: TextStyles.textAlt
                                          .copyWith(fontSize: Dimens.fontSmall),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Visibility(
                                    visible: _listMediaFilter[index].type ==
                                        _document,
                                    child: Text(
                                        _listMediaFilter[index].fileSize ??
                                            "")),
                              )
                            ],
                          ),
                        ).padding(
                            edgeInsets:
                                EdgeInsets.symmetric(vertical: dp8(context)));
                      },
                    ),
                  )
                : Empty(),
          ),
        ),
      ],
    );
  }
}
