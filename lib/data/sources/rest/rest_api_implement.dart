import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:brupedia/di/di.dart';
import 'package:dio/dio.dart';

import '../sources.dart';

class RestApiImpl with RestAPI {
  var _dio = sl<API>().getDio();

  @override
  Future<Response> login(Map<String, String> _params) async =>
      await _dio.post("/api/token", data: _params);

  @override
  Future<DictionaryResponse> icons() async {
    try {
      Response _response = await _dio.get("/dictionaries/icon.json");

      var _result = DictionaryResponse.fromJson(_response.data);
      if (_response.statusCode == 200)
        return _result;
      else
        throw (_result);
    } catch (e) {
      return e;
    }
  }

  @override
  Future<DictionaryResponse> colors() async {
    try {
      Response _response = await _dio.get("/dictionaries/text.json");

      var _result = DictionaryResponse.fromJson(_response.data);
      if (_response.statusCode == 200)
        return _result;
      else
        throw (_result);
    } catch (e) {
      return e;
    }
  }

  @override
  Future<DictionaryResponse> texts() async {
    try {
      Response _response = await _dio.get("/dictionaries/color.json");

      var _result = DictionaryResponse.fromJson(_response.data);
      if (_response.statusCode == 200)
        return _result;
      else
        throw (_result);
    } catch (e) {
      return e;
    }
  }
}
