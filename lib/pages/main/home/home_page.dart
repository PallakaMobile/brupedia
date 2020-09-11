import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/pages/jobdesc/jobdesc.dart';
import 'package:brupedia/pages/jobknowledge/jobknowledge.dart';
import 'package:brupedia/pages/sop/sop.dart';
import 'package:brupedia/pages/troubleshooting/troubleshooting.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCard(),
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
                      context.goTo(BlocProvider(
                        create: (context) => ListBidangBloc(),
                        child: JobDescPage(),
                      ));
                    },
                    imageUrl: "ic_job_desc".toIconDictionary(),
                    title: Strings.job,
                    subTitle: Strings.description,
                    type: TypeMenu.JOB_DESC),
                MenuCard(
                    onPressed: () {
                      context.goTo(BlocProvider(
                        create: (context) => ListBidangBloc(),
                        child: SopPage(),
                      ));
                    },
                    imageUrl: "ic_sop".toIconDictionary(),
                    title: Strings.sop,
                    subTitle: "",
                    type: TypeMenu.SOP),
                MenuCard(
                    onPressed: () {
                      context.goTo(BlocProvider(
                        create: (context) => ListBidangBloc(),
                        child: JobKnowledgePage(),
                      ));
                    },
                    imageUrl: "ic_job_knowledge".toIconDictionary(),
                    title: Strings.job,
                    subTitle: Strings.knowledge,
                    type: TypeMenu.JOB_KNOW),
                MenuCard(
                    onPressed: () {
                      context.goTo(BlocProvider(
                        create: (context) => ListBidangBloc(),
                        child: TroubleshootingPage(),
                      ));
                    },
                    imageUrl: "ic_permasalahan".toIconDictionary(),
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
