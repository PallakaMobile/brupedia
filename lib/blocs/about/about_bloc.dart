import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'about_event.dart';

class AboutBloc extends Bloc<AboutEvent, Resources<String>> {
  AboutBloc() : super(Resources.loading());

  @override
  Stream<Resources<String>> mapEventToState(AboutEvent event) async* {
    var _masterRepo = sl<MasterRepository>();
    if (event is GetAboutEvent) {
      yield Resources.loading();
      yield await _masterRepo.about();
    }
  }
}
