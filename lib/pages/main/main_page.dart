import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/helper/DataSelected.dart';
import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/widgets/copy_right_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<DataSelected> _dataMenus;
  NavDrawerBloc _drawerBloc;

  @override
  void initState() {
    super.initState();
    _drawerBloc = BlocProvider.of<NavDrawerBloc>(context);
    _dataMenus = [
      DataSelected(Strings.mainMenu, true), // set main menu as default selected
      DataSelected(Strings.about, false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Hero(
          tag: "logo",
          child: Image.asset(
            "images/ic_brupedia_color.png",
            height: dp30(context),
          ),
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
      body: BlocBuilder<NavDrawerBloc, NavigationStates>(
        builder: (context, navigationState) {
          return navigationState as Widget;
        },
      ),
      endDrawer: SizedBox(
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
                                        bottomRight:
                                            Radius.circular(dp36(context)))),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: SvgPicture.asset(
                                  "images/ic_header_pattern.svg",
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
                                      child: Icon(Icons.motorcycle),
                                      backgroundColor: Palette.colorLink,
                                    ),
                                    SizedBox(
                                      width: dp8(context),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Pallaka Studio",
                                            style: TextStyles.whiteBold),
                                        Text(
                                          "Supervisor Bidang Enjiniring",
                                          style: TextStyles.white.copyWith(
                                            fontSize: Dimens.fontSmall,
                                          ),
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
                                    _drawerBloc.add(NavigationEvents.HomePage);
                                  else
                                    _drawerBloc.add(NavigationEvents.AboutPage);

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
                                        style: TextStyles.primaryBold.copyWith(
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
                  Row(
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
    );
  }
}
