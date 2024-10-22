import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<GetEmail>((event, emit) {
      emit(state.copyWith(
        email: event.email,
      ));
    });

    on<GetPassword>((event, emit) {
      emit(state.copyWith(
        password: event.password,
      ));
    });

    on<PasswordObscured>((event, emit) {
      emit(state.copyWith(
        isPasswordObscured: !state.isPasswordObscured,
      ));
    });

    on<LoginSubmitted>((event, emit) async {
      final email = state.email;
      final password = state.password;

      if (email.isNotEmpty && password.isNotEmpty) {
        emit(state.copyWith(isSubmitting: true));
        await Future.delayed(const Duration(seconds: 1)); //anggap lagi send request
        if (state.email == 'hasan' && state.password == '12345'){
          emit(state.copyWith(
            isNotValid: false,
            isSubmitting: false,
            isSuccess: true
          ));
        }
        else {
          emit(state.copyWith(
            isNotValid: false,
            isSubmitting: false,
            isFailure: true,
          ));
        }
      } else {
        emit(state.copyWith(
          isNotValid: true,
          isSubmitting: false,
          isFailure: false,
        ));
      }
    });
  }
}
