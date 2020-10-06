import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_troubleshoot.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class TroubleshootRepository {
  Future<Resources<ListTroubleshoot>> listTroubleshoot(
      Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.listTroubleshoot(params);
      var _responseListTroubleshoot = ListTroubleshoot.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseListTroubleshoot);
      } else {
        return Resources.error(_responseListTroubleshoot.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
