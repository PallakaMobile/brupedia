import 'package:dio/dio.dart';

class API {
  static const BASE_URL = "";

  Dio getDio({String token}) {
    var _xToken = "";
    /*  try {
      _xToken = token ?? sl<PrefManager>().getToken();
    } catch (e) {
      _xToken = null;
    }*/
    return Dio(BaseOptions(
        baseUrl: BASE_URL,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'B88755C31BDB2EBDE1E0C460694A1724',
          'x-token': _xToken
        },
        receiveTimeout: 60000,
        connectTimeout: 60000,
        validateStatus: (int status) {
          return status > 0;
        }))
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
