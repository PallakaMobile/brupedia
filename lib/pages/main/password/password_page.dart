import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic_response.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  var _conOldPassword = TextEditingController();
  var _conNewPassword = TextEditingController();
  var _conNewPasswordRepeat = TextEditingController();

  var _isHideOldPassword = true;
  var _isHideNewPassword = true;
  var _isHideNewPasswordRepeat = true;

  var _fnOldPassword = FocusNode();
  var _fnNewPassword = FocusNode();
  var _fnNewPasswordRepeat = FocusNode();
  var _formKey = GlobalKey<FormState>();
  PasswordBloc _passwordBloc;

  @override
  void initState() {
    super.initState();
    _passwordBloc = BlocProvider.of<PasswordBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
        appBar: null,
        child: BlocListener(
          cubit: _passwordBloc,
          listener: (_, state) {
            switch (state.status) {
              case Status.LOADING:
                {
                  Strings.harapTunggu.toToastLoading();
                }

                break;
              case Status.ERROR:
                {
                  dismissAllToast(showAnim: true);
                  print(state.message.toString());
                  state.message.toString().toToastError();
                }
                break;
              case Status.SUCCESS:
                {
                  //check isRemember ?
                  dismissAllToast(showAnim: true);
                  DiagnosticResponse _response = state.data;
                  _response.diagnostic.message.toToastSuccess();

                  //reset password field
                  _conOldPassword.clear();
                  _conNewPassword.clear();
                  _conNewPasswordRepeat.clear();
                }
                break;
              default:
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.changePassword,
                  style: TextStyles.primaryBold.copyWith(
                    fontSize: Dimens.fontLarge,
                  ),
                ),
                SizedBox(
                  height: dp16(context),
                ),
                TextF(
                  maxLine: 1,
                  hint: Strings.oldPassword,
                  textInputAction: TextInputAction.next,
                  controller: _conOldPassword,
                  curFocusNode: _fnOldPassword,
                  nextFocusNode: _fnNewPassword,
                  obscureText: _isHideOldPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      !_isHideOldPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Palette.colorPrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHideOldPassword = !_isHideOldPassword;
                      });
                    },
                  ),
                  validator: (value) =>
                      value.isEmpty ? Strings.errorEmpty : null,
                ),
                SizedBox(
                  height: dp8(context),
                ),
                TextF(
                  maxLine: 1,
                  hint: Strings.newPassword,
                  textInputAction: TextInputAction.next,
                  controller: _conNewPassword,
                  curFocusNode: _fnNewPassword,
                  nextFocusNode: _fnNewPasswordRepeat,
                  obscureText: _isHideNewPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      !_isHideNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Palette.colorPrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHideNewPassword = !_isHideNewPassword;
                      });
                    },
                  ),
                  validator: (value) =>
                      value.isEmpty ? Strings.errorEmpty : null,
                ),
                SizedBox(
                  height: dp8(context),
                ),
                TextF(
                  maxLine: 1,
                  hint: Strings.newPasswordRepeat,
                  textInputAction: TextInputAction.done,
                  controller: _conNewPasswordRepeat,
                  curFocusNode: _fnNewPasswordRepeat,
                  obscureText: _isHideNewPasswordRepeat,
                  suffixIcon: IconButton(
                    icon: Icon(
                      !_isHideNewPasswordRepeat
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Palette.colorPrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHideNewPasswordRepeat = !_isHideNewPasswordRepeat;
                      });
                    },
                  ),
                  validator: (value) =>
                      value.isEmpty ? Strings.errorEmpty : null,
                ),
                SizedBox(
                  height: dp16(context),
                ),
                Button(
                  title: Strings.save,
                  fontSize: Dimens.fontNormal,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //check if new password match wit new password repeat
                      if (_conNewPassword.text == _conNewPasswordRepeat.text) {
                        var _params = Map<String, String>()
                          ..["oldPassword"] = _conOldPassword.text.toString()
                          ..["newPassword"] = _conNewPassword.text.toString()
                          ..["renewPassword"] =
                              _conNewPasswordRepeat.text.toString();
                        _passwordBloc.add(PostUpdatePassword(_params));
                      } else {
                        Strings.errorNotMatch.toToastError();
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
