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
  final String message;

  LoginState({
    required this.email,
    required this.password,
    required this.isPasswordObscured,
    required this.status,
    required this.message
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordObscured,
    LoginStatus? status,
    String? message
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
      message: message ?? this.message
    );
  }
}
