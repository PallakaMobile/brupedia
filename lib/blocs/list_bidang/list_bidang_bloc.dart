import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/list_bidang_response.dart';
import 'package:brupedia/data/repositories/repositories.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'list_bidang_event.dart';

class ListBidangBloc
    extends Bloc<ListBidangEvent, Resources<ListBidangResponse>> {
  ListBidangBloc() : super(Resources.loading());

  @override
  Stream<Resources<ListBidangResponse>> mapEventToState(
      ListBidangEvent event) async* {
    var _masterRepo = sl<MasterRepository>();
    if (event is GetListBidangEvent) {
      yield Resources.loading();
      yield await _masterRepo.listBidang();
    }
  }
}
