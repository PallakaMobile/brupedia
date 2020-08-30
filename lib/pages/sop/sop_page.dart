import 'package:brupedia/data/models/helper/DataProfile.dart';
import 'package:brupedia/pages/sop/list/sop_list.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SopPage extends StatefulWidget {
  SopPage({Key key}) : super(key: key);

  @override
  _SopPageState createState() => _SopPageState();
}

class _SopPageState extends State<SopPage> {
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
            label: Strings.sop,
            onChanged: (value) {
              context.logs(value);
            },
          ),
          SizedBox(
            height: dp16(context),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: dp24(context)),
              child: Scrollbar(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: dp16(context),
                  mainAxisSpacing: dp16(context),
                  shrinkWrap: true,
                  childAspectRatio: 2 / 1.5,
                  children: [
                    MenuCard(
                        onPressed: () {
                          context.goTo(SopListPage());
                        },
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP),
                    MenuCard(
                        onPressed: () {},
                        imagePath: "images/ic_sop.svg",
                        title: Strings.bidang,
                        subTitle: Strings.description,
                        type: TypeMenu.SOP)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
