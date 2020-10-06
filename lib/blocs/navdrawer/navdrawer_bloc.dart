import 'package:bloc/bloc.dart';
import 'package:brupedia/pages/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs.dart';

enum NavigationEvents {
  HomePage,
  Password,
  AboutPage,
}

class NavDrawerBloc extends Bloc<NavigationEvents, Widget> {
  NavDrawerBloc() : super(HomePage());

  @override
  Stream<Widget> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePage:
        yield HomePage();
        break;
      case NavigationEvents.AboutPage:
        yield BlocProvider(
            create: (context) => AboutBloc(), child: AboutPage());
        break;
      case NavigationEvents.Password:
        yield BlocProvider(
            create: (context) => PasswordBloc(), child: PasswordPage());
        break;
    }
  }
}
