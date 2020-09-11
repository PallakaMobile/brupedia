import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/utils/helper.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

extension StringExtension on String {
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  String toDate() {
    var object = new DateFormat("yyyy-MM-ddTHH:mm:ss").parse(this);
    return DateFormat("dd MMMM yyyy").format(object);
  }

  String toClock() {
    var object = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
    return DateFormat("HH:mm").format(object);
  }

  toToastError() {
    try {
      var message = this == null || this.isEmpty ? "error" : this;
      showToastWidget(
          Toast(
            bgColor: Colors.red,
            icon: Icons.error,
            message: message,
            textColor: Colors.white,
          ),
          dismissOtherToast: true,
          position: ToastPosition.top,
          duration: Duration(seconds: 2));
    } catch (e) {
      print("error $e");
    }
  }

  toToastSuccess() {
    try {
      var message = (this == null || this.isEmpty) ? "success" : this;
      // showToast(msg)
      showToastWidget(
          Toast(
            bgColor: Colors.green,
            icon: Icons.check_circle,
            message: message,
            textColor: Colors.white,
          ),
          dismissOtherToast: true,
          position: ToastPosition.top,
          duration: Duration(seconds: 2));
    } catch (e) {
      print("success $e");
    }
  }

  toToastLoading() {
    try {
      var message = this == null || this.isEmpty ? "loading" : this;
      showToast(message);
      showToastWidget(
          Toast(
            bgColor: Colors.black,
            icon: Icons.info,
            message: message,
            textColor: Colors.white,
          ),
          dismissOtherToast: true,
          position: ToastPosition.top,
          duration: Duration(seconds: 3));
    } catch (e) {
      print("loading $e");
    }
  }

  String toTextDictionary() {
    try {
      logs(
          "key $this : value : ${sl.get<DictionaryResponse>(instanceName: "text").data.singleWhere((element) => element.key.toLowerCase() == this.toLowerCase()).value}");
      return sl
          .get<DictionaryResponse>(instanceName: "text")
          .data
          .singleWhere(
              (element) => element.key.toLowerCase() == this.toLowerCase())
          .value;
    } catch (e) {
      logs(e);
      return "key $this belum terdaftar";
    }
  }

  Color toColorDictionary() {
    try {
      logs(
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
