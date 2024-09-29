import 'package:farmbroapk/farmbro/profil.dart';
import 'package:farmbroapk/resource/WidgetSuhu.dart';
import 'package:farmbroapk/resource/Widgetlembap.dart';
import 'package:farmbroapk/resource/diagramWidget.dart';
import 'package:farmbroapk/resource/color/mycolor.dart';
import 'package:farmbroapk/resource/widgetgasdanayam.dart';
import 'package:flutter/material.dart';

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  int _currentIndex = 0;

  // Daftar halaman untuk BottomNavigationBar
  final List<Widget> _pages = [
    HomeContent(), // Konten halaman Beranda
    Text('Halaman Lampu'), // Halaman Lampu (sementara)
    ProfileScreen(), // Halaman Profil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai dengan _currentIndex
      body: _pages[_currentIndex],
      
      // Bottom Navigation Bar
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), // Melengkung pada pojok kiri atas
          topRight: Radius.circular(15), // Melengkung pada pojok kanan atas
        ),
        child: BottomNavigationBar(
          backgroundColor: bottomnav,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Ganti halaman saat ikon ditekan
            });
          },
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Lampu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}

// Konten halaman beranda (HomeContent)
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        // Container dengan tinggi 24% dari layar
        Container(
          width: screenSize.width,
          height: screenSize.height * 0.24,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logoayam.png'), fit: BoxFit.cover),
            color: Color(0xFFA16651),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),

        // Bagian bawah dari tampilan
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Widgetsuhu(),
                      SizedBox(height: 20),
                      KelembapanCard(),
                      SizedBox(height: 20),
                      ayamdangasWidget(),
                      SizedBox(height: 20),
                      diagramCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
