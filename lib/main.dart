import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util/firebase_options.dart';

import 'package:farmbroapk/page/dashboard/dashboard_bloc.dart';
import 'package:farmbroapk/page/home_page.dart';
import 'package:farmbroapk/page/login/login_bloc.dart';
import 'package:farmbroapk/page/profile/profile_bloc.dart';
import 'package:farmbroapk/page/remote/remote_bloc.dart';
import 'package:farmbroapk/page/login/login_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String token;

  const MyApp({
    super.key,
    required this.token
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
          accentColor: Colors.grey
        )
      ),
      home: (token.isNotEmpty) ?
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(),
          ),
          BlocProvider(
            create: (context) => RemoteBloc(),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(),
          )
        ],
        child: const HomePage()
      )
      : BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
    );
  }
}