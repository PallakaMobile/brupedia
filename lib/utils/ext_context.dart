import 'package:brupedia/blocs/navdrawer/navdrawer_bloc.dart';
import 'package:brupedia/pages/pages.dart';
import 'package:brupedia/resources/resources.dart';
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
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(
        builder: (context) =>
            BlocProvider(
                create: (context) => NavDrawerBloc(), child: MainPage())), (
        route) => false);
  }

  appBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Palette.colorPrimary,),
        onPressed: () {
          Navigator.pop(this);
        },),
      automaticallyImplyLeading: true,
      title: Hero(
        tag: "logo",
        child: Image.asset(
          "images/ic_brupedia_color.png",
          height: dp30(this),
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("images/ic_home.svg", color: Palette
              .colorPrimary,),
          onPressed: () {
            goToClearStack(HomePage());
          },
        )
      ],
    );
  }
}
