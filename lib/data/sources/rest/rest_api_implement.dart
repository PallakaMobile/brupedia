import 'package:brupedia/di/di.dart';
import 'package:dio/dio.dart';

import '../sources.dart';

class RestApiImpl with RestAPI {
  var _dio = sl<API>().getDio();

  @override
  Future<Response> login(Map<String, String> _params) async =>
      await _dio.post("/api/token", data: _params);

  @override
  Future<Response> icons() async => await _dio.get("/dictionaries/icon.json");

  @override
  Future<Response> colors() async => await _dio.get("/dictionaries/color.json");

  @override
  Future<Response> texts() async => await _dio.get("/dictionaries/text.json");
}
