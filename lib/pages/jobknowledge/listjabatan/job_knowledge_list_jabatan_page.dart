import 'package:brupedia/data/models/models.dart';
import 'package:brupedia/pages/jobknowledge/list/job_knowledge_list.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListJabatanPage extends StatefulWidget {
  JobKnowledgeListJabatanPage({Key key}) : super(key: key);

  @override
  _JobKnowledgeListJabatanPageState createState() =>
      _JobKnowledgeListJabatanPageState();
}

class _JobKnowledgeListJabatanPageState
    extends State<JobKnowledgeListJabatanPage> {
  var _listDataSelected = List<DataSelected>();
  var _listDataSelectedFilter = List<DataSelected>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      _listDataSelected.add(DataSelected(title: "Staff ${i + 1}"));
    }
    _listDataSelectedFilter = _listDataSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          UserCard(
            dataProfile: DataProfile(
                userName: "ukieTux",
                title: "Mobile Dev",
                position: "SPV",
                imageUrl:
                    "https://avatars0.githubusercontent.com/u/1531684?s=400&u=e01e622a1c219bb04c8d69fb0cc06f14231ebbcd&v=4"),
          ),
          SizedBox(
            height: dp16(context),
          ),
          SearchLabel(
            label: "${Strings.bidang} ${Strings.enjinering}",
            onChanged: (value) {
              context.logs(value);
              setState(() {
                if (value.isNotEmpty) {
                  _listDataSelectedFilter = _listDataSelected
                      .where((element) => element.title
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                } else {
                  _listDataSelectedFilter = _listDataSelected;
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
              child: _listDataSelectedFilter.isNotEmpty
                  ? Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _listDataSelectedFilter.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.goTo(JobKnowledgeListPage());
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Palette.bgJobKnowledge,
                                  child: SvgPicture.network(
                                    "ic_job_knowledge_list".toIconDictionary(),
                                  ),
                                ),
                                SizedBox(
                                  width: dp4(context),
                                ),
                                Text(
                                  _listDataSelectedFilter[index].title,
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
      ),
    );
  }
}
