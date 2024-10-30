import 'package:farmbroapk/page/profile/profile_page.dart';
import 'package:farmbroapk/page/remote/remote_page.dart';
import 'package:farmbroapk/util/reusable/generic_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../util/reusable/color.dart';
import 'dashboard/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const RemotePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async{
        final shouldExit = await showDialog(
          context: context,
          builder: (context) => const GenericAlertDialog(
            titleDialog: 'Keluar',
            messageDialog: 'Apakah kamu yakin ingin keluar'
          )
        );
        if (shouldExit){
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
            ),
            backgroundColor: bottomnav,
            selectedItemColor: Colors.orange.shade50,
            unselectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.radio_button_on),
                label: 'Lampu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      )
    );
  }
}