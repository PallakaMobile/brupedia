import 'package:bloc/bloc.dart';
import 'package:brupedia/pages/main/about/about_page.dart';
import 'package:brupedia/pages/main/home/home_page.dart';

enum NavigationEvents {
  HomePage,
  AboutPage,
}

abstract class NavigationStates {}

class NavDrawerBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavDrawerBloc() : super(HomePage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePage:
        yield HomePage();
        break;
      case NavigationEvents.AboutPage:
        yield AboutPage();
        break;
    }
  }
}
