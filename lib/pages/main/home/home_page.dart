import 'package:brupedia/blocs/navdrawer/navdrawer_bloc.dart';
import 'package:brupedia/data/models/helper/DataProfile.dart';
import 'package:brupedia/pages/jobdesc/job_desc_page.dart';
import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/scroll_views.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class HomePage extends StatefulWidget with NavigationStates {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScrollViews(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Text(
            Strings.mainMenu,
            style: TextStyles.textBold.copyWith(
              fontSize: Dimens.fontLarge,
            ),
          ),
          SizedBox(
            height: dp16(context),
          ),
          Container(
            height: heightInPercent(60, context),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: dp16(context),
              mainAxisSpacing: dp16(context),
              childAspectRatio: 2 / 1.5,
              children: [
                MenuCard(
                    onPressed: () {
                      context.goTo(JobDescPage());
                    },
                    imagePath: "images/ic_job_desc.svg",
                    title: Strings.job,
                    subTitle: Strings.description,
                    type: TypeMenu.JOB_DESC),
                MenuCard(
                    onPressed: () {},
                    imagePath: "images/ic_sop.svg",
                    title: Strings.sop,
                    subTitle: "",
                    type: TypeMenu.SOP),
                MenuCard(
                    onPressed: () {},
                    imagePath: "images/ic_job_knowledge.svg",
                    title: Strings.job,
                    subTitle: Strings.knowledge,
                    type: TypeMenu.JOB_KNOW),
                MenuCard(
                    onPressed: () {},
                    imagePath: "images/ic_permasalahan.svg",
                    title: Strings.permasalahan,
                    subTitle: Strings.andTroubleShooting,
                    type: TypeMenu.TROUBLE)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
