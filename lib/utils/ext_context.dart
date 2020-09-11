import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/pages/main/main.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension ContextExtensions on BuildContext {
  bool isMobile() {
    var shortestSide = MediaQuery.of(this).size.shortestSide;
    return shortestSide < 600;
  }

  logs(dynamic message) {
    print(
        "========================================================================================");
    print("| Message Log : $message");
    print("| Widget Name : ${this.widget}");
    print(
        "========================================================================================");
  }

  goTo(Widget widget) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  goToReplacePageRoute(Widget widget) {
    Navigator.pushReplacement(
        this,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (_, __, ___) => widget));
  }

  goToReplace(Widget widget) {
    Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  goToClearStack(Widget widget) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  appBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Palette.colorPrimary,
        ),
        onPressed: () {
          Navigator.pop(this);
        },
      ),
      automaticallyImplyLeading: true,
      title: Hero(
        tag: "logo",
        child: Image.network(
          "ic_brupedia_color".toIconDictionary(),
          height: dp30(this),
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.network(
            "ic_home".toIconDictionary(),
            color: Palette.colorPrimary,
          ),
          onPressed: () {
            goToClearStack(MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => NavDrawerBloc()),
                BlocProvider(create: (context) => LogoutBloc())
              ],
              child: MainPage(),
            ));
          },
        )
      ],
    );
  }
}
