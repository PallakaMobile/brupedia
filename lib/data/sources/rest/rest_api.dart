import 'package:dio/dio.dart';

abstract class RestAPI {
  Future<Response> login(Map<String, String> _params);

  Future<Response> texts();

  Future<Response> colors();

  Future<Response> icons();

  Future<Response> logout();

  Future<Response> listJabatan(Map<String, String> _params);

  Future<Response> listBidang();

  Future<Response> jobDescription(String id);

  Future<Response> about();

  Future<Response> jobKnowledge(Map<String, String> _params);

  Future<Response> sop(Map<String, String> _params);

  Future<Response> listTroubleshoot(Map<String, String> _params);

  Future<Response> updatePassword(Map<String, String> _params);
}
