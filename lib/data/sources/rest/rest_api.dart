import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:dio/dio.dart';

abstract class RestAPI {
  Future<Response> login(Map<String, String> _params);

  Future<DictionaryResponse> texts();

  Future<DictionaryResponse> colors();

  Future<DictionaryResponse> icons();
}
