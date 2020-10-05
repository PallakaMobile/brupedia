import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/job_description_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class JobDescriptionRepository {
  Future<Resources<JobDescriptionResponse>> jobDescription(String id) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.jobDescription(id);
      var _responseJobDescription =
          JobDescriptionResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseJobDescription);
      } else {
        return Resources.error(_responseJobDescription.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
