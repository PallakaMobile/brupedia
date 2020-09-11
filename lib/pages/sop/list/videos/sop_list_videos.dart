import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/pages/sop/list/videos/sop_list_videos_detail.dart';
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
class SopListVideos extends StatefulWidget {
  SopListVideos({Key key, this.listMedia, this.name}) : super(key: key);
  final List<Data> listMedia;
  final String name;

  @override
  _SopListVideosState createState() => _SopListVideosState();
}

class _SopListVideosState extends State<SopListVideos> {
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
          label: "${widget.name} - ${Strings.video}",
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
                            context.goTo(SopListVideosDetail(
                              fileName: _listMediaFilter[index].nama,
                              url: _listMediaFilter[index].link,
                            ));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Palette.bgSop,
                                child: SvgPicture.network(
                                  "ic_list_videos".toIconDictionary(),
                                  height: dp16(context),
                                  color: Palette.textSop,
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
                                    style: TextStyles.textAlt
                                        .copyWith(fontSize: Dimens.fontSmall),
                                  ),
                                ],
                              ),
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
