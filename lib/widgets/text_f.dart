import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextF extends StatefulWidget {
  const TextF(
      {Key key,
      this.curFocusNode,
      this.nextFocusNode,
      this.hint,
      this.validator,
      this.onChanged,
      this.keyboardType,
      this.textInputAction,
      this.obscureText,
      this.suffixIcon,
      this.controller,
      this.onTap,
      this.textAlign,
      this.enable,
      this.inputFormatters,
      this.minLine,
      this.maxLine})
      : super(key: key);

  final FocusNode curFocusNode;
  final FocusNode nextFocusNode;
  final String hint;
  final Function(String) validator;
  final Function(String) onChanged;
  final Function onTap;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool obscureText;
  final int minLine;
  final int maxLine;
  final Widget suffixIcon;
  final TextAlign textAlign;
  final bool enable;
  final List<TextInputFormatter> inputFormatters;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      enabled: widget.enable,
      obscureText: widget.obscureText ?? false,
      focusNode: widget.curFocusNode,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign ?? TextAlign.start,
      minLines: widget.minLine ?? 1,
      maxLines: widget.maxLine ?? 10,
      inputFormatters: widget.inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: Palette.colorText,
        fontSize: Dimens.fontNormal,
      ),
      cursorColor: Palette.colorText,
      decoration: InputDecoration(
          labelText: widget.hint,
          labelStyle: TextStyle(
            color: Palette.colorText,
          ),
          alignLabelWithHint: true,
          suffixIcon: widget.suffixIcon,
          contentPadding: EdgeInsets.symmetric(
              vertical: dp8(context), horizontal: dp16(context)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dp8(context)),
              gapPadding: dp4(context))),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: (value) {
        setState(() {
          fieldFocusChange(context, widget.curFocusNode, widget.nextFocusNode);
        });
      },
    ).margin(edgeInsets: EdgeInsets.symmetric(vertical: dp4(context)));
  }

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
