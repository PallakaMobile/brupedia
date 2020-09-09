import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/pages/sop/sop.dart';
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
class SopListAll extends StatefulWidget {
  SopListAll({Key key, this.listMedia, this.name}) : super(key: key);
  final List<Data> listMedia;
  final String name;

  @override
  _SopListAllState createState() => _SopListAllState();
}

class _SopListAllState extends State<SopListAll> {
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
          label: "${widget.name}  - ${Strings.all}",
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
                            if (_listMediaFilter[index].type == "url") {
                              context.goTo(SopListVideosDetail(
                                fileName: _listMediaFilter[index].nama,
                                url: _listMediaFilter[index].link,));
                            } else {
                              context.goTo(SopListDocumentsDetail(
                                fileName: _listMediaFilter[index].nama,
                                url: _listMediaFilter[index].link,));
                            }
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Palette.bgSop,
                                child: SvgPicture.network(
                                  _listMediaFilter[index].type == "url"
                                      ? "ic_list_videos".toIconDictionary()
                                      : "ic_list_document".toIconDictionary(),
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
                                    style: TextStyles.textAlt.copyWith(
                                        fontSize: Dimens.fontSmall),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Visibility(
                                  visible: _listMediaFilter[index].type ==
                                      "file",
                                  child: Text(
                                      _listMediaFilter[index].fileSize ?? ""))
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
