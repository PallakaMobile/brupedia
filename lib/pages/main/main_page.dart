import 'dart:convert';

import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/data/models/responses/diagnostic_response.dart';
import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/pages/login/login_page.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<DataSelected> _dataMenus;
  NavDrawerBloc _drawerBloc;
  LogoutBloc _logoutBloc;
  String _currentOpen = Strings.mainMenu;

  User _user;

  @override
  void initState() {
    super.initState();
    //register user on DI
    _user = User.fromJson(json.decode(sl<PrefManager>().getUser()));

    _logoutBloc = BlocProvider.of<LogoutBloc>(context);
    _drawerBloc = BlocProvider.of<NavDrawerBloc>(context);
    _dataMenus = [
      DataSelected(title: Strings.mainMenu, isSelected: true),
      DataSelected(title: Strings.password, isSelected: false),
      DataSelected(title: Strings.about, isSelected: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.logs("onBackPress");
        if (_currentOpen == Strings.mainMenu) {
          context.logs("true");
          return true;
        } else {
          context.logs("false");
          if (_scaffoldKey.currentState.isEndDrawerOpen) {
            //hide navigation drawer
            _scaffoldKey.currentState.openDrawer();
          } else {
            _drawerBloc.add(NavigationEvents.HomePage);

            _dataMenus.forEach((element) {
              setState(() {
                if (element.title == Strings.mainMenu)
                  element.isSelected = true;
                else
                  element.isSelected = false;
              });
            });
            _currentOpen = Strings.mainMenu;
          }
          return false;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          title: Image.network(
            "ic_brupedia_color".toIconDictionary(),
            height: dp30(context),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.sort,
                color: Palette.colorPrimary,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
            )
          ],
        ),
        body: BlocBuilder<NavDrawerBloc, Widget>(
          builder: (context, navigationState) {
            return navigationState;
          },
        ),
        endDrawer: BlocListener(
          cubit: _logoutBloc,
          listener: (_, state) async {
            switch (state.status) {
              case Status.LOADING:
                {
                  Strings.harapTunggu.toToastLoading();
                }

                break;
              case Status.ERROR:
                {
                  dismissAllToast(showAnim: true);
                  state.message.toString().toToastError();
                }
                break;
              case Status.SUCCESS:
                {
                  sl<PrefManager>().logout(); // clear data

                  dismissAllToast(showAnim: true);
                  DiagnosticResponse _response = state.data;
                  _response.diagnostic.message.toToastSuccess();
                  context.goToClearStack(BlocProvider(
                      create: (context) => LoginBloc(), child: LoginPage()));
                }
                break;
              default:
            }
          },
          child: SizedBox(
            width: widthInPercent(100, context),
            child: Drawer(
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: widthInPercent(75, context),
                              height: Dimens.header,
                              child: Stack(
                                children: [
                                  Container(
                                    height: Dimens.header,
                                    width: widthInPercent(80, context),
                                    decoration: BoxDecoration(
                                        color: Palette.colorPrimary,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                                dp36(context)))),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: SvgPicture.network(
                                      "ic_header_pattern".toIconDictionary(),
                                      width: 150,
                                    ),
                                  ),
                                  Positioned(
                                    left: dp8(context),
                                    top: 0,
                                    bottom: 0,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(_user
                                                  .profile.avatar ??
                                              "https://avatars0.githubusercontent.com/u/1531684?s=400&u=e01e622a1c219bb04c8d69fb0cc06f14231ebbcd&v=4"),
                                          radius: 30.h,
                                        ),
                                        SizedBox(
                                          width: dp8(context),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(_user.name,
                                                style: TextStyles.whiteBold),
                                            Row(
                                              children: [
                                                Text(
                                                  _user.profile.jabatan,
                                                  style:
                                                      TextStyles.white.copyWith(
                                                    fontSize: Dimens.fontSmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: dp4(context),
                                                ),
                                                Text(
                                                  _user.profile.bidang,
                                                  style:
                                                      TextStyles.white.copyWith(
                                                    fontSize: Dimens.fontSmall,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                //hide navigation drawer
                                _scaffoldKey.currentState.openDrawer();
                              },
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.close,
                                color: Palette.colorLink,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: dp30(context),
                      ),
                      Column(
                        children: _dataMenus
                            .map<Widget>((value) => InkWell(
                                  onTap: () {
                                    _dataMenus.forEach((element) {
                                      setState(() {
                                        if (element.title == value.title)
                                          element.isSelected = true;
                                        else
                                          element.isSelected = false;
                                      });

                                      //return selected page
                                      if (value.title == Strings.mainMenu)
                                        _drawerBloc
                                            .add(NavigationEvents.HomePage);
                                      else if (value.title == Strings.password)
                                        _drawerBloc
                                            .add(NavigationEvents.Password);
                                      else
                                        _drawerBloc
                                            .add(NavigationEvents.AboutPage);

                                      setState(() {
                                        _currentOpen = value.title;
                                      });

                                      //hide navigation drawer
                                      _scaffoldKey.currentState.openDrawer();
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Opacity(
                                            opacity: value.isSelected ? 1 : 0,
                                            child: Container(
                                              color: Palette.colorLink,
                                              width: 4,
                                              height: dp30(context),
                                            ),
                                          ),
                                          SizedBox(
                                            width: dp16(context),
                                          ),
                                          Text(
                                            value.title,
                                            style:
                                                TextStyles.primaryBold.copyWith(
                                              fontSize: Dimens.fontLarge,
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: dp36(context),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            // false = user must tap button, true = tap outside dialog
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text(
                                  Strings.exit,
                                  style: TextStyles.primaryBold
                                      .copyWith(fontSize: Dimens.fontLarge),
                                ),
                                content: Text(Strings.askExit,
                                    style: TextStyles.text),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(Strings.cancel,
                                        style: TextStyles.text),
                                    onPressed: () {
                                      Navigator.of(dialogContext)
                                          .pop(); // Dismiss alert dialog
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      Strings.exit,
                                      style: TextStyles.primary,
                                    ),
                                    onPressed: () {
                                      _logoutBloc.add(PostLogoutEvent());
                                      Navigator.of(dialogContext)
                                          .pop(); // Dismiss alert dialog
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Container(
                                color: Palette.colorLink,
                                width: 4,
                                height: dp30(context),
                              ),
                            ),
                            SizedBox(
                              width: dp16(context),
                            ),
                            Icon(
                              Icons.power_settings_new,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: dp4(context),
                            ),
                            Text(
                              Strings.exit,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: Dimens.fontLarge,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: dp16(context),
                    bottom: dp16(context),
                    child: CopyRightText(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
