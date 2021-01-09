import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/blocs/dictionary/dictionary_bloc.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/pages/login/login_page.dart';
import 'package:brupedia/pages/main/main.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/copy_right_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  DictionaryBloc _dictionaryBloc;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    await initPrefManager();
    _dictionaryBloc = BlocProvider.of<DictionaryBloc>(context);
    _dictionaryBloc.add(GetDictionaryEvent());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
      allowFontScaling: false,
    );
    return Scaffold(
      backgroundColor: Palette.colorPrimary,
      appBar: null,
      body: BlocListener(
        cubit: _dictionaryBloc,
        listener: (_, state) async {
          switch (state.status) {
            case Status.ERROR:
              {
                dismissAllToast(showAnim: true);
                state.message.toString().toToastError();
              }
              break;
            case Status.SUCCESS:
              {
                //register all dictionary
                await registerDictionaryTexts();
                await registerDictionaryColors();
                await registerDictionaryIcons();
                dismissAllToast(showAnim: true);
                if (sl<PrefManager>().getIsLogin())
                  context.goToReplacePageRoute(MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => NavDrawerBloc()),
                      BlocProvider(create: (context) => LogoutBloc())
                    ],
                    child: BlocProvider(
                        create: (context) => NavDrawerBloc(),
                        child: MainPage()),
                  ));
                else
                  context.goToReplacePageRoute(BlocProvider(
                      create: (context) => LoginBloc(), child: LoginPage()));
              }
              break;
            default:
          }
        },
        child: Stack(
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
                    child: Image.asset("images/ic_brupedia_white.png",
                        width: widthInPercent(70, context)),
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
      ),
    );
  }
}
