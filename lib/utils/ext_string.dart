import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/helper.dart';
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

  String toTextDictionary() {
    try {
      print(
          "key $this : value : ${sl.get<DictionaryResponse>(instanceName: "text").data.singleWhere((element) => element.key.toLowerCase() == this.toLowerCase()).value}");
      return sl
          .get<DictionaryResponse>(instanceName: "text")
          .data
          .singleWhere(
              (element) => element.key.toLowerCase() == this.toLowerCase())
          .value;
    } catch (e) {
      print(e);
      return "key $this belum terdaftar";
    }
  }

  Color toColorDictionary() {
    try {
      print(
          "key color $this : value ${sl.get<DictionaryResponse>(instanceName: "color").data.singleWhere((element) => element.key.toLowerCase() == this.toLowerCase()).value}");
      return Color(int.parse(sl
          .get<DictionaryResponse>(instanceName: "color")
          .data
          .singleWhere(
              (element) => element.key.toLowerCase() == this.toLowerCase())
          .value));
    } catch (e) {
      logs("error color $e");
      return null;
    }
  }

  String toIconDictionary() {
    try {
      return sl
          .get<DictionaryResponse>(instanceName: "icon")
          .data
          .singleWhere(
              (element) => element.key.toLowerCase() == this.toLowerCase())
          .value;
    } catch (e) {
      return e.toString();
    }
  }
}
