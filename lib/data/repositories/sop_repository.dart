import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class SOPRepository {
  Future<Resources<MediaResponse>> sop(Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _responseJobDescription = await _restApi.sop(params);
      if (_responseJobDescription.statusCode == 200) {
        return Resources.success(
            data: MediaResponse.fromJson(_responseJobDescription.data));
      } else {
        return Resources.error(
            Diagnostic.fromJson(_responseJobDescription.data).message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
