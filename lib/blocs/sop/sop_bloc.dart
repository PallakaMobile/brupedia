import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/media_response.dart';
import 'package:brupedia/data/repositories/sop_repository.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'sop_event.dart';

class SOPBloc extends Bloc<SOPEvent, Resources<MediaResponse>> {
  SOPBloc() : super(Resources.loading());

  @override
  Stream<Resources<MediaResponse>> mapEventToState(SOPEvent event) async* {
    var _sopRepo = sl<SOPRepository>();
    if (event is GetSOPEvent) {
      if (event.isFirstPage) yield Resources.loading();
      yield await _sopRepo.sop(event.params);
    }
  }
}
