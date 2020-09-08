import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic.dart';
import 'package:brupedia/data/models/responses/job_knowledge_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class JobKnowledgeRepository {
  Future<Resources<JobKnowledgeResponse>> jobKnowledge(
      Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _responseJobDescription = await _restApi.jobKnowledge(params);
      if (_responseJobDescription.statusCode == 200) {
        return Resources.success(
            data: JobKnowledgeResponse.fromJson(_responseJobDescription.data));
      } else {
        return Resources.error(
            Diagnostic.fromJson(_responseJobDescription.data).message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
