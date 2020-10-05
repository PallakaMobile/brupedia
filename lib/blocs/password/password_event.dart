part of 'password_bloc.dart';

abstract class PasswordEvent {}

class PostUpdatePassword extends PasswordEvent {
  final Map<String, String> params;

  PostUpdatePassword(this.params);
}
