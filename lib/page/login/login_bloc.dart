import 'package:farmbroapk/model/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        emit(state.copyWith(status: LoginStatus.submitting));
        try{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          dynamic response = await LoginRepository().getUserToken(email, password);
          await prefs.setString('token', response['token']);
          emit(state.copyWith(
              status: LoginStatus.success
          ));
        }
        catch(e) {
          emit(state.copyWith(
              status: LoginStatus.failure
          ));
        }
      } else {
        emit(state.copyWith(
          status: LoginStatus.notValid
        ));
      }
    });
  }
}
