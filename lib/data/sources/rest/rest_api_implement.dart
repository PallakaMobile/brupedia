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

  @override
  Future<Response> logout() async => await _dio.post("/api/revoke");

  @override
  Future<Response> listBidang() async => await _dio.get("/api/master/bidang");

  @override
  Future<Response> listJabatan(Map<String, String> _params) async =>
      await _dio.get("/api/master/jabatan", queryParameters: _params);

  @override
  Future<Response> jobDescription(String id) async =>
      await _dio.get("/api/job-description/$id");

  @override
  Future<Response> about() async => await _dio.get("/api/tentang");
}
