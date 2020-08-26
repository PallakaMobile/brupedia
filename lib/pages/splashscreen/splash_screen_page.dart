import 'package:brupedia/pages/login/login_page.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/copy_right_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      context.goToReplacePageRoute(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812,
      allowFontScaling: false,
    );
    return Scaffold(
      backgroundColor: Palette.colorPrimary,
      appBar: null,
      body: Stack(
        children: [
          Positioned(
              top: dp30(context),
              left: 0,
              right: 0,
              child: Center(
                child: Hero(
                  tag: "pln",
                  child: Image.asset(
                    "images/ic_pln.png",
                    width: widthInPercent(30, context),
                  ),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    "images/ic_brupedia_white.png",
                    width: widthInPercent(70, context),
                  ),
                ),
              )),
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "images/ic_splash_bottom.svg",
              width: widthInPercent(100, context),
            ),
          ),
          Positioned(
            bottom: dp16(context),
            left: 0,
            right: 0,
            child: CopyRightText(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
