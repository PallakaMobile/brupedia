import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/resources.dart';
import 'package:brupedia/data/models/responses/diagnostic_response.dart';
import 'package:brupedia/data/repositories/master_repository.dart';
import 'package:brupedia/di/di.dart';

part 'password_event.dart';

class PasswordBloc extends Bloc<PasswordEvent, Resources<DiagnosticResponse>> {
  PasswordBloc() : super(Resources.loading());

  @override
  Stream<Resources<DiagnosticResponse>> mapEventToState(
      PasswordEvent event) async* {
    var _masterRepo = sl<MasterRepository>();
    if (event is PostUpdatePassword) {
      yield Resources.loading();
      yield await _masterRepo.updatePassword(event.params);
    }
  }
}
