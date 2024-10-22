part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isPasswordObscured;
  final bool isSubmitting;
  final bool isNotValid;
  final bool isSuccess;
  final bool isFailure;

  LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordObscured = false,
    this.isSubmitting = false,
    this.isNotValid = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailNotEmpty,
    bool? isPasswordNotEmpty,
    bool? isPasswordObscured,
    bool? isSubmitting,
    bool? isNotValid,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isNotValid: isNotValid ?? this.isNotValid,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
