import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_troubleshoot.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'troubleshoot_event.dart';

class TroubleshootBloc
    extends Bloc<TroubleshootEvent, Resources<ListTroubleshoot>> {
  TroubleshootBloc() : super(Resources.loading());

  @override
  Stream<Resources<ListTroubleshoot>> mapEventToState(
      TroubleshootEvent event) async* {
    var _troubleshootRepo = sl<TroubleshootRepository>();
    if (event is GetTroubleshootEvent) {
      yield Resources.loading();
      yield await _troubleshootRepo.listTroubleshoot(event.params);
    }
  }
}
