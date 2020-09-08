import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobKnowledgeListVideosDetail extends StatefulWidget {
  JobKnowledgeListVideosDetail({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _JobKnowledgeListVideosDetailState createState() =>
      _JobKnowledgeListVideosDetailState();
}

class _JobKnowledgeListVideosDetailState
    extends State<JobKnowledgeListVideosDetail> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    var ytId = widget.url.split("=");
    _controller = YoutubePlayerController(
      initialVideoId: ytId[1],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (_, player) {
        return Parent(
          appBar: context.appBar(),
          child: player,
        );
      },
      player: YoutubePlayer(
        controller: _controller,
      ),
    );
  }
}
