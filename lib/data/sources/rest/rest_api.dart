import 'package:dio/dio.dart';

abstract class RestAPI {
  Future<Response> login(Map<String, String> _params);

  Future<Response> texts();

  Future<Response> colors();

  Future<Response> icons();

  Future<Response> logout();
}
