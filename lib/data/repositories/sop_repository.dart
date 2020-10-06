import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class SOPRepository {
  Future<Resources<MediaResponse>> sop(Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.sop(params);
      var _responseSOP = MediaResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseSOP);
      } else {
        return Resources.error(_responseSOP.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
