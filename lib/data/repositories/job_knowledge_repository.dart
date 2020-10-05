import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class JobKnowledgeRepository {
  Future<Resources<MediaResponse>> jobKnowledge(
      Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.jobKnowledge(params);
      var _responseKnowledge = MediaResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseKnowledge);
      } else {
        return Resources.error(_responseKnowledge.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
