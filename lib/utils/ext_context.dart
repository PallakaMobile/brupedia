import 'package:flutter/material.dart';

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
}
