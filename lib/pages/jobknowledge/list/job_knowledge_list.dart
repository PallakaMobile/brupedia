import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/pages/jobknowledge/list/all/job_knowledge_list_all.dart';
import 'package:brupedia/pages/jobknowledge/list/documents/job_knowledge_list_documents.dart';
import 'package:brupedia/pages/jobknowledge/list/videos/job_knowledge_list_videos.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/custom_tab.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListPage extends StatefulWidget {
  JobKnowledgeListPage({Key key}) : super(key: key);

  @override
  _JobKnowledgeListPageState createState() => _JobKnowledgeListPageState();
}

class _JobKnowledgeListPageState extends State<JobKnowledgeListPage> {
  var _listLabel = List<DataSelected>();
  var _listFragment = List<Widget>();

  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    _listLabel.add(DataSelected(
        title: "Semua", isSelected: true, icon: "images/ic_list_all.svg"));
    _listLabel.add(DataSelected(
        title: "Video", isSelected: false, icon: "images/ic_list_videos.svg"));
    _listLabel.add(DataSelected(
        title: "Dokumen",
        isSelected: false,
        icon: "images/ic_list_document.svg"));
    _listFragment = [
      JobKnowledgeListAll(),
      JobKnowledgeListVideos(),
      JobKnowledgeListDocuments(),
    ];
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
          CustomTab(
            listData: _listLabel,
            selected: (int) {
              context.logs("selected $int");
              _pageController.jumpToPage(int);
            },
          ),
          SizedBox(
            height: dp8(context),
          ),
          Expanded(
            child: PageView.builder(
              physics: ClampingScrollPhysics(),
              onPageChanged: (int page) {
                for (var item in _listLabel) {
                  setState(() {
                    if (_listLabel[page].title == item.title)
                      item.isSelected = true;
                    else
                      item.isSelected = false;
                  });
                }
              },
              itemCount: _listFragment.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return _listFragment[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
