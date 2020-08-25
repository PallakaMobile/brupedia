import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/resources/styles.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/button_link.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved

enum Category { REGISTER, FORGOT }

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _conUsername = TextEditingController();
  var _conPassword = TextEditingController();
  var _fnUserName = FocusNode();
  var _fnPassword = FocusNode();

  var _isRemember = false;
  var _isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ScrollViews(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Palette.colorPrimary,
              height: heightInPercent(50, context),
              child: Stack(
                children: [
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
                ],
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.login,
                  style:
                      TextStyles.textBold.copyWith(fontSize: Dimens.fontLarge1),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: dp12(context),
              ),
              TextF(
                hint: Strings.userName,
                textInputAction: TextInputAction.next,
                controller: _conUsername,
                curFocusNode: _fnUserName,
                nextFocusNode: _fnPassword,
              ),
              SizedBox(
                height: dp8(context),
              ),
              TextF(
                obscureText: _isHidePassword,
                maxLine: 1,
                hint: Strings.password,
                textInputAction: TextInputAction.done,
                controller: _conPassword,
                curFocusNode: _fnPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    !_isHidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Palette.colorPrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isHidePassword = !_isHidePassword;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    value: _isRemember,
                    onChanged: (val) {
                      setState(() {
                        _isRemember = val;
                      });
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isRemember = !_isRemember;
                        });
                      },
                      child: Text(Strings.rememberUser)),
                  Spacer(),
                  ButtonLink(
                    title: Strings.passwordForgotAsk,
                    onPressed: () {
                      _showDialog(Category.FORGOT);
                    },
                  )
                ],
              ),
              SizedBox(
                height: dp16(context),
              ),
              Button(
                title: Strings.login,
                onPressed: () {},
              ),
              SizedBox(
                height: dp16(context),
              ),
              Text(
                Strings.registerTitle,
                textAlign: TextAlign.center,
              ),
              ButtonLink(
                title: Strings.register,
                onPressed: () {
                  _showDialog(Category.REGISTER);
                },
              ),
              SizedBox(
                height: dp30(context),
              ),
              CopyRightText()
            ]).padding(edgeInsets: EdgeInsets.all(dp16(context)))
          ],
        ),
      ),
    );
  }

  _showDialog(Category _category) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return CupertinoDialogAction(
            //this right here
            textStyle: TextStyles.text,
            isDestructiveAction: false,
            isDefaultAction: true,
            child: Container(
              decoration: BoxDecorations.white,
              height: Dimens.height50,
              width: widthInPercent(90, context),
              child: Column(children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _category == Category.REGISTER
                          ? Strings.register
                          : Strings.passwordForgot,
                      style: TextStyles.textBold.copyWith(
                        fontSize: Dimens.fontLarge2,
                      ),
                    ).padding(edgeInsets: EdgeInsets.only(left: dp16(context))),
                    FlatButton(
                        splashColor: Palette.colorHint,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.close,
                          color: Palette.colorPrimary,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SvgPicture.asset(
                  _category == Category.REGISTER
                      ? "images/ic_register.svg"
                      : "images/ic_forgot_password.svg",
                  width: double.infinity,
                  height: Dimens.height30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: TextStyles.text,
                        text: Strings.registerDialog,
                      ),
                      TextSpan(
                        style: TextStyles.primaryBold,
                        text: Strings.clickHere,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (_category == Category.REGISTER) {
                              context.logs("taps register");
                            } else {
                              context.logs("taps forgotPassword");
                            }
                          },
                      ),
                    ],
                  ),
                ).padding(edgeInsets: EdgeInsets.all(dp16(context))),
              ]),
            ));
      },
    );
  }
}
