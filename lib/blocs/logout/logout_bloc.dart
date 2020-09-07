import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/diagnostic_response.dart';
import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/data/repositories/login_repository.dart';
import 'package:brupedia/di/di.dart';

part 'logout_event.dart';

class LogoutBloc extends Bloc<LogoutEvent, Resources<DiagnosticResponse>> {
  LogoutBloc() : super(Resources.loading());

  @override
  Stream<Resources<DiagnosticResponse>> mapEventToState(
      LogoutEvent event) async* {
    var _loginRepo = sl<LoginRepository>();
    if (event is PostLogoutEvent) {
      yield Resources.loading();
      yield await _loginRepo.logout();
    }
  }
}
