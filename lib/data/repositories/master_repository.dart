import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic_response.dart';
import 'package:brupedia/data/models/responses/list_bidang_response.dart';
import 'package:brupedia/data/models/responses/list_jabatan_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class MasterRepository {
  Future<Resources<ListJabatanResponse>> listJabatan(
      Map<String, String> params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.listJabatan(params);
      var _responseListJabatan = ListJabatanResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseListJabatan);
      } else {
        return Resources.error(_responseListJabatan.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }

  Future<Resources<ListBidangResponse>> listBidang() async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.listBidang();
      var _responseListBidang = ListBidangResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseListBidang);
      } else {
        return Resources.error(_responseListBidang.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }

  Future<Resources<String>> about() async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _responseAbout = await _restApi.about();
      if (_responseAbout.statusCode == 200) {
        return Resources.success(data: _responseAbout.data);
      } else {
        return Resources.error(DiagnosticResponse.fromJson(_responseAbout.data)
            .diagnostic
            .message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }

  Future<Resources<DiagnosticResponse>> updatePassword(
      Map<String, String> _params) async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _response = await _restApi.updatePassword(_params);
      var _responseUpdatePassword = DiagnosticResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return Resources.success(data: _responseUpdatePassword);
      } else {
        return Resources.error(_responseUpdatePassword.diagnostic.message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
