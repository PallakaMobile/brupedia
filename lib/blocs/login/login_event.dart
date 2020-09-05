part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class PostLoginEvent extends LoginEvent {
  final Map<String, String> params;

  PostLoginEvent(this.params);
}
