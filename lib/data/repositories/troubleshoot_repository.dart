import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic.dart';
import 'package:brupedia/data/models/responses/list_troubleshoot.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class TroubleshootRepository {
  Future<Resources<ListTroubleshoot>> listTroubleshoot(
      Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _responseJobDescription = await _restApi.listTroubleshoot(params);
      if (_responseJobDescription.statusCode == 200) {
        return Resources.success(
            data: ListTroubleshoot.fromJson(_responseJobDescription.data));
      } else {
        return Resources.error(
            Diagnostic.fromJson(_responseJobDescription.data).message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
