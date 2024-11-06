import 'package:farmbroapk/model/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(
    email: '',
    password: '',
    isPasswordObscured: false,
    status: LoginStatus.initial,
    message: ''
  ))
  {
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
        emit(state.copyWith(
            status: LoginStatus.submitting
          )
        );
        try{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          dynamic response = await LoginRepository().getUserToken(email, password);
          final token = response['token'];
          if (token != null) {
            await prefs.setString('token', token);
            emit(state.copyWith(
                status: LoginStatus.success,
                message: ""
            ));
          } else {
            emit(state.copyWith(
                status: LoginStatus.failure,
                message: "Email atau password anda salah"
            ));
          }
        }
        catch(e) {
          emit(state.copyWith(
              status: LoginStatus.failure,
              message: e.toString()
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
