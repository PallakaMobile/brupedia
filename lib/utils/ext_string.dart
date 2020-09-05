import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  String toDate() {
    var object = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
    return DateFormat("dd MMM yy").format(object);
  }

  String toClock() {
    var object = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
    return DateFormat("HH:mm").format(object);
  }

  toToastError() {
    FlutterFlexibleToast.showToast(
        message: this,
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.TOP,
        icon: ICON.ERROR,
        radius: 30,
        elevation: 10,
        imageSize: 20,
        fontSize: Dimens.fontNormal,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
        timeInSeconds: 2);
  }

  toToastSuccess() {
    FlutterFlexibleToast.showToast(
        message: this,
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.TOP,
        icon: ICON.SUCCESS,
        radius: 30,
        elevation: 10,
        imageSize: 20,
        fontSize: Dimens.fontNormal,
        textColor: Colors.white,
        backgroundColor: Colors.green,
        timeInSeconds: 2);
  }

  toToastLoading() {
    FlutterFlexibleToast.showToast(
        message: this,
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.TOP,
        icon: ICON.LOADING,
        radius: 30,
        elevation: 10,
        imageSize: 20,
        fontSize: Dimens.fontNormal,
        textColor: Palette.colorHint,
        timeInSeconds: 2);
  }
}
