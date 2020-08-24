import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'di.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerFactory<API>(() => API());

  sl.registerFactory<DbHelper>(() => DbHelper());
}
