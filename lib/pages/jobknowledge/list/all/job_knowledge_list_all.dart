import 'package:brupedia/data/models/responses/job_knowledge_response.dart';
import 'package:brupedia/pages/jobknowledge/jobknowledge.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListAll extends StatefulWidget {
  JobKnowledgeListAll({Key key, this.listMedia}) : super(key: key);
  final List<Data> listMedia;

  @override
  _JobKnowledgeListAllState createState() => _JobKnowledgeListAllState();
}

class _JobKnowledgeListAllState extends State<JobKnowledgeListAll> {
  var _listMediaFilter = List<Data>();

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
          label: "${Strings.bidang} ${Strings.enjinering} - Semua",
          onChanged: (value) {
            context.logs(value);
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
                            if (_listMediaFilter[index].type == "url") {
                              context.goTo(JobKnowledgeListVideosDetail(
                                url: _listMediaFilter[index].url,));
                            } else {
                              context.goTo(JobKnowledgeListDocumentsDetail(
                                url: _listMediaFilter[index].url,));
                            }
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Palette.bgJobKnowledge,
                                child: SvgPicture.network(
                                  _listMediaFilter[index].type == "url"
                                      ? "ic_list_videos".toIconDictionary()
                                      : "ic_list_document".toIconDictionary(),
                                  height: dp16(context),
                                ),
                              ),
                              SizedBox(
                                width: dp4(context),
                              ),
                              Text(
                                _listMediaFilter[index].nama ?? "Untitled",
                                style: TextStyles.text,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: dp16(context),
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
