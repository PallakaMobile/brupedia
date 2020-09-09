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
class JobKnowledgeListDocuments extends StatefulWidget {
  JobKnowledgeListDocuments({Key key, this.listMedia}) : super(key: key);
  final List<Data> listMedia;

  @override
  _JobKnowledgeListDocumentsState createState() =>
      _JobKnowledgeListDocumentsState();
}

class _JobKnowledgeListDocumentsState extends State<JobKnowledgeListDocuments> {
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
          label:
              "${Strings.bidang} ${Strings.enjinering} - ${Strings.document}",
          onChanged: (value) {
            context.logs(value);
            setState(() {
              if (value.isNotEmpty) {
                _listMediaFilter = widget.listMedia
                    .where((element) => element.nama
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              } else {
                _listMediaFilter = widget.listMedia;
              }
            });
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
                            context.goTo(JobKnowledgeListDocumentsDetail(
                              fileName: _listMediaFilter[index].nama,
                              url: _listMediaFilter[index].url,));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Palette.bgJobKnowledge,
                                child: SvgPicture.network(
                                  "ic_list_document".toIconDictionary(),
                                  height: dp16(context),
                                ),
                              ),
                              SizedBox(
                                width: dp4(context),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _listMediaFilter[index].nama ?? "Untitled",
                                    style: TextStyles.text,
                                  ),
                                  Text(
                                    _listMediaFilter[index].updatedAt.toDate(),
                                    style: TextStyles.textAlt.copyWith(
                                        fontSize: Dimens.fontSmall),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(_listMediaFilter[index].fileSize ?? "")

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
