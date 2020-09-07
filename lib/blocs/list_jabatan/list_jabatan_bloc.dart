import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_jabatan_response.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'list_jabatan_event.dart';

class ListJabatanBloc
    extends Bloc<ListJabatanEvent, Resources<ListJabatanResponse>> {
  ListJabatanBloc() : super(Resources.loading());

  @override
  Stream<Resources<ListJabatanResponse>> mapEventToState(
      ListJabatanEvent event) async* {
    var _masterRepo = sl<MasterRepository>();
    if (event is GetListJabatanEvent) {
      yield Resources.loading();
      yield await _masterRepo.listJabatan(event.params);
    }
  }
}
