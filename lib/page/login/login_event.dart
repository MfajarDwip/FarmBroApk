part of 'login_bloc.dart';

abstract class LoginEvent {}

class PasswordObscured extends LoginEvent {
  final bool isPasswordObscured;

  PasswordObscured(this.isPasswordObscured);
}

class GetEmail extends LoginEvent {
  final String email;

  GetEmail(this.email);
}

class GetPassword extends LoginEvent {
  final String password;

  GetPassword(this.password);
}

class LoginSubmitted extends LoginEvent {

}
