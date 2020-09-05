import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/services_locator.dart';

class LoginRepository {
  Future<Resources<LoginResponse>> login(Map<String, String> _params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.login(_params);
      var _loginResponse = LoginResponse.fromJson(_response.data);
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
