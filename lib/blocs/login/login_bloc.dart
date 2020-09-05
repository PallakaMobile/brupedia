import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/data/repositories/login_repository.dart';
import 'package:brupedia/di/di.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, Resources<LoginResponse>> {
  LoginBloc() : super(Resources.loading());

  @override
  Stream<Resources<LoginResponse>> mapEventToState(LoginEvent event) async* {
    var _loginRepo = sl<LoginRepository>();
    if (event is PostLoginEvent) {
      yield Resources.loading();
      var _response = await _loginRepo.login(event.params);
      yield _response;
    }
  }
}
