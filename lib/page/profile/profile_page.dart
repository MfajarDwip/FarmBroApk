import 'package:farmbroapk/page/login/login_page.dart';
import 'package:farmbroapk/page/profile/change_password/change_password_bloc.dart';
import 'package:farmbroapk/page/profile/change_password/change_password_page.dart';
import 'package:farmbroapk/util/reusable/generic_button.dart';
import 'package:farmbroapk/util/reusable/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/login_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.20,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/coba.png'),
                      fit: BoxFit.cover
                  ),
                  color: navbar,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: -50,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/cuy.png'
                  )
                ),
              ),
              const Positioned(
                bottom: -120,
                child: Column(
                  children: [
                    Text(
                      'Fadias Keyn',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Owner',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height / 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.brown),
                  title: const Text('+6285859714058'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.brown),
                  title: Text('fadiaskeyn@gmail.com'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(
                  indent: 25,
                  endIndent: 25,
                  thickness: 1,
                  color: Colors.black12,
                ),
                const SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.brown),
                  title: Text('Ubah Password'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => ChangePasswordBloc(),
                          child: const ChangePasswordPage(),
                        ),
                      )
                    );
                  },
                ),
                SizedBox(height: screenSize.height / 4.5),
                GenericButton(
                  text: 'KELUAR AKUN',
                  colorButton: Colors.red,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => LoginBloc(),
                          child: const LoginPage(),
                        ),
                      )
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
