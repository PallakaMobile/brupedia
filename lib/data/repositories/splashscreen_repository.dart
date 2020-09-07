import 'dart:convert';

import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/di/services_locator.dart';

class SplashScreenRepository {
  Future<Resources<DictionaryResponse>> dictionary() async {
    var _restApi = sl<RestApiImpl>();
    try {
      var _responseIcons = await _restApi.icons();
      var _responseTexts = await _restApi.texts();
      var _responseColors = await _restApi.colors();

      if (_responseIcons.statusCode == 200 &&
          _responseIcons.statusCode == 200 &&
          _responseColors.statusCode == 200) {
        await sl<PrefManager>().setIcons(
            json.encode(DictionaryResponse.fromJson(_responseIcons.data)));
        await sl<PrefManager>().setTexts(
            json.encode(DictionaryResponse.fromJson(_responseTexts.data)));
        await sl<PrefManager>().setColors(
            json.encode(DictionaryResponse.fromJson(_responseColors.data)));

        return Resources.success(
            data: DictionaryResponse.fromJson(_responseColors.data));
      } else {
        return Resources.error(DictionaryResponse.fromJson(_responseIcons.data)
            .diagnostic
            .message);
      }
    } catch (e) {
      return Resources.error(e.toString());
    }
  }
}
