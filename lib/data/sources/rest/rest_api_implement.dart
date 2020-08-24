import 'dart:io';

import 'package:brupedia/di/di.dart';

import '../sources.dart';

class RestApiImpl with RestAPI {
  var _dio = sl<API>().getDio();

/*@override
  Future<LatLng> getLatLng(Map<String, String> _params) async {
    Response _response = await _dio.get(
        "https://maps.googleapis.com/maps/api/geocode/json?",
        queryParameters: _params);
    var _responseGeolocation = ResponseGeolocation.fromJson(_response.data);
    return LatLng(_responseGeolocation.results[0].geometry.location.lat,
        _responseGeolocation.results[0].geometry.location.lng);
  }

  @override
  Future<ResponseDictionary> getDictionary(Map<String, String> _params) async {
    try {
      Response _response =
          await _dio.get("v1/app_language_keys/all", queryParameters: _params);
      return ResponseDictionary.fromJson(_response.data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ResponseLogin> postLogin(Map<String, String> _params) async {
    try {
      Response _response = await _dio.post("v1/user/login",
          data: _params,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return ResponseLogin.fromJson(_response.data);
    } catch (e) {
      return null;
    }
  }*/
}
