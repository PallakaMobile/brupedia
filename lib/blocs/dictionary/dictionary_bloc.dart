import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/dictionary_response.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'dictionary_event.dart';

class DictionaryBloc
    extends Bloc<DictionaryEvent, Resources<DictionaryResponse>> {
  DictionaryBloc() : super(Resources.loading());

  @override
  Stream<Resources<DictionaryResponse>> mapEventToState(
      DictionaryEvent event) async* {
    var _splashRepo = sl<SplashScreenRepository>();
    if (event is GetDictionaryEvent) {
      yield Resources.loading();
      yield await _splashRepo.dictionary();
    }
  }
}
