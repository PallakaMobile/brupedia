import 'dart:convert';

import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic_response.dart';
import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class LoginRepository {
  Future<Resources<LoginResponse>> login(Map<String, String> _params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.login(_params);
      var _loginResponse = LoginResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        //save token
        await sl<PrefManager>().setToken(
            "${_loginResponse.data.tokenType} ${_loginResponse.data.accessToken}");
        await sl<PrefManager>().setUser(json.encode(_loginResponse.data.user));
        return Resources.success(data: _loginResponse);
      } else {
        return Resources.error(_loginResponse.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }

  Future<Resources<DiagnosticResponse>> logout() async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.logout();
      var _loginResponse = DiagnosticResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _loginResponse);
      } else {
        return Resources.error(_loginResponse.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
