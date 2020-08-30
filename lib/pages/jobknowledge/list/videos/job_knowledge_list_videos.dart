import 'package:brupedia/data/models/models.dart';
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
class JobKnowledgeListVideos extends StatefulWidget {
  JobKnowledgeListVideos({Key key}) : super(key: key);

  @override
  _JobKnowledgeListVideosState createState() => _JobKnowledgeListVideosState();
}

class _JobKnowledgeListVideosState extends State<JobKnowledgeListVideos> {
  var _listMedia = List<DataMedia>();
  var _listMediaFilter = List<DataMedia>();

  @override
  void initState() {
    super.initState();
    for (int x = 0; x < 10; x++) {
      _listMedia.add(DataMedia(
          title: "Media ${x + 1}",
          icon: "images/ic_list_videos.svg",
          type: "video"));
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
          label: "${Strings.bidang} ${Strings.enjinering} - Videos",
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
                            context.goTo(JobKnowledgeListVideosDetail());
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
