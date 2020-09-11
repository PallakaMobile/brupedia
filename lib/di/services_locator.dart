import 'dart:convert';

import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/data/repositories/job_description_repository.dart';
import 'package:brupedia/data/repositories/job_knowledge_repository.dart';
import 'package:brupedia/data/repositories/login_repository.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/data/repositories/troubleshoot_repository.dart';
import 'package:brupedia/data/sources/sources.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerFactory<API>(() => API());
  sl.registerFactory<RestApiImpl>(() => RestApiImpl());
  sl.registerFactory<DbHelper>(() => DbHelper());

  //register  Repositories
  sl.registerLazySingleton(() => SplashScreenRepository());
  sl.registerLazySingleton(() => LoginRepository());
  sl.registerLazySingleton(() => MasterRepository());
  sl.registerLazySingleton(() => JobDescriptionRepository());
  sl.registerLazySingleton(() => JobKnowledgeRepository());
  sl.registerLazySingleton(() => SOPRepository());
  sl.registerLazySingleton(() => TroubleshootRepository());
}

//register prefManager
Future<void> initPrefManager() async {
  var _initPrefManager = await SharedPreferences.getInstance();
  sl.registerLazySingleton<PrefManager>(() => PrefManager(_initPrefManager));
}

registerUser() async {
  //register response to reuse
  try {
    print("text sl :${sl<PrefManager>().getUser()}");
    User _user = User.fromJson(json.decode(sl<PrefManager>().getUser()));
    sl.registerLazySingleton(() => _user);
  } catch (e) {
    print(e);
  }
}

registerDictionaryTexts() async {
  //register response to reuse
  print("text sl :${sl<PrefManager>().getText()}");
  DictionaryResponse _dictionary =
      DictionaryResponse.fromJson(json.decode(sl<PrefManager>().getText()));
  sl.registerLazySingleton(() => _dictionary, instanceName: "text");
}

registerDictionaryIcons() {
  //register response to reuse
  DictionaryResponse _dictionary =
      DictionaryResponse.fromJson(json.decode(sl<PrefManager>().getIcon()));
  sl.registerLazySingleton(() => _dictionary, instanceName: "icon");
}

registerDictionaryColors() {
  //register response to reuse
  DictionaryResponse _dictionary =
      DictionaryResponse.fromJson(json.decode(sl<PrefManager>().getColor()));
  sl.registerLazySingleton(() => _dictionary, instanceName: "color");
}
