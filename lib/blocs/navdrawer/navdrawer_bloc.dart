import 'package:bloc/bloc.dart';
import 'package:brupedia/blocs/about/about_bloc.dart';
import 'package:brupedia/pages/main/about/about_page.dart';
import 'package:brupedia/pages/main/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvents {
  HomePage,
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
    }
  }
}
