import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic.dart';
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
      var _responseListJabatan = await _restApi.listJabatan(params);
      if (_responseListJabatan.statusCode == 200) {
        return Resources.success(
            data: ListJabatanResponse.fromJson(_responseListJabatan.data));
      } else {
        return Resources.error(
            Diagnostic.fromJson(_responseListJabatan.data).message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }

  Future<Resources<ListBidangResponse>> listBidang() async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _responseListBidang = await _restApi.listBidang();
      if (_responseListBidang.statusCode == 200) {
        return Resources.success(
            data: ListBidangResponse.fromJson(_responseListBidang.data));
      } else {
        return Resources.error(
            Diagnostic.fromJson(_responseListBidang.data).message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
