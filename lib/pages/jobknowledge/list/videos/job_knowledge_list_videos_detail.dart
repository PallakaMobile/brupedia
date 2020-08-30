import 'package:brupedia/data/models/models.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListVideosDetail extends StatefulWidget {
  JobKnowledgeListVideosDetail({Key key}) : super(key: key);

  @override
  _JobKnowledgeListVideosDetailState createState() =>
      _JobKnowledgeListVideosDetailState();
}

class _JobKnowledgeListVideosDetailState
    extends State<JobKnowledgeListVideosDetail> {
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
    return Parent(
      appBar: context.appBar(),
      child: Center(
        child: Text("Video Player"),
      ),
    );
  }
}
