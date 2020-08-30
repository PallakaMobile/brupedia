import 'package:brupedia/data/models/models.dart';
import 'package:brupedia/pages/jobknowledge/list/documents/job_knowledge_list_documents_detail.dart';
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
  JobKnowledgeListDocuments({Key key}) : super(key: key);

  @override
  _JobKnowledgeListDocumentsState createState() =>
      _JobKnowledgeListDocumentsState();
}

class _JobKnowledgeListDocumentsState extends State<JobKnowledgeListDocuments> {
  var _listMedia = List<DataMedia>();
  var _listMediaFilter = List<DataMedia>();

  @override
  void initState() {
    super.initState();
    for (int x = 0; x < 10; x++) {
      _listMedia.add(DataMedia(
          title: "Media ${x + 1}",
          icon: "images/ic_list_document.svg",
          type: "document"));
    }
    _listMediaFilter = _listMedia;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SearchLabel(
          label: "${Strings.bidang} ${Strings.enjinering} - Documents",
          onChanged: (value) {
            context.logs(value);
            setState(() {
              if (value.isNotEmpty) {
                _listMediaFilter = _listMedia
                    .where((element) => element.title
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              } else {
                _listMediaFilter = _listMedia;
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
                            context.goTo(JobKnowledgeListDocumentsDetail());
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Palette.bgJobKnowledge,
                                child: SvgPicture.asset(
                                  _listMediaFilter[index].icon,
                                  height: dp16(context),
                                ),
                              ),
                              SizedBox(
                                width: dp4(context),
                              ),
                              Text(
                                _listMediaFilter[index].title,
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
