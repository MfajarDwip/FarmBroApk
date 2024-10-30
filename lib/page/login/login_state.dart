part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  submitting,
  notValid,
  success,
  failure,
}

class LoginState {
  final String email;
  final String password;
  final bool isPasswordObscured;
  final LoginStatus status;

  LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordObscured = false,
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordObscured,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
    );
  }
}
