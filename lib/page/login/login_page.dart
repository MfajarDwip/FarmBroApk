import 'package:flutter/material.dart';
import 'package:farmbroapk/util/reusable/generic_button.dart';
import 'package:farmbroapk/util/reusable/generic_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dashboard/dashboard_bloc.dart';
import '../dashboard/dashboard_page.dart';
import '../home_page.dart';
import '../remote/remote_bloc.dart';
import '../remote/remote_page.dart';
import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => DashboardBloc(),
                      child: const DashboardPage(),
                    ),
                    BlocProvider(
                      create: (context) => RemoteBloc(),
                      child: const RemotePage(),
                    )
                  ],
                  child: const HomePage(),
                )
              )
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final loginBloc = context.read<LoginBloc>();
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF99613C),
                    image: DecorationImage(
                      image: AssetImage('assets/bg_splash.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 1.5,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
                          child: Column(
                            children: [
                              const Text(
                                'Selamat Datang',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 50),
                              GenericTextFormField(
                                isTextObscure: false,
                                hintText: 'Email',
                                iconPrefix: const Icon(Icons.person),
                                onChanged: (value) => loginBloc.add(GetEmail(value)),
                              ),
                              const SizedBox(height: 30),
                              GenericTextFormField(
                                isTextObscure: (state.isPasswordObscured)
                                    ? false
                                    : true,
                                hintText: 'Password',
                                iconPrefix: const Icon(Icons.lock),
                                iconSuffix: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: GestureDetector(
                                    onTap: () => context.read<LoginBloc>()
                                        .add(PasswordObscured(false)),
                                    child: Icon(
                                      (state.isPasswordObscured)
                                          ? Icons.visibility_rounded
                                          : Icons.visibility_off,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                onChanged: (value) => loginBloc.add(GetPassword(value)),
                              ),
                              if(state.status == LoginStatus.submitting)
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                                  child: LinearProgressIndicator(),
                                ),
                              if(!(state.status == LoginStatus.submitting))
                                const SizedBox(height: 30),
                              GenericButton(
                                  text: 'MASUK',
                                  colorButton: Colors.orange,
                                  onPressed: () => context.read<LoginBloc>()
                                      .add(LoginSubmitted())
                              ),
                              if(state.status == LoginStatus.notValid)
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text("Harap isi email dan password anda"),
                                ),
                              if(state.status == LoginStatus.failure)
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text("Email atau Password anda salah"),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
