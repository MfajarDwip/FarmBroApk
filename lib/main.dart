import 'package:farmbroapk/page/dashboard/dashboard_bloc.dart';
import 'package:farmbroapk/page/home_page.dart';
import 'package:farmbroapk/page/login/login_bloc.dart';
import 'package:farmbroapk/page/remote/remote_bloc.dart';
import 'package:farmbroapk/page/dashboard/dashboard_page.dart';
import 'package:farmbroapk/page/login/login_page.dart';
import 'package:farmbroapk/page/remote/remote_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'util/helper/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool setStatus = prefs.getBool('log_status') ?? false;
  runApp(MyApp(isLoggedIn: setStatus));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.isLoggedIn
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (isLoggedIn) ?
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
        child: const HomePage()
      )
      : BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
    );
  }
}