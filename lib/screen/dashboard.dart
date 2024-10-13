import 'package:farmbroapk/screen/remote.dart';
import 'package:farmbroapk/util/reusable/chart.dart';
import 'package:farmbroapk/util/reusable/sensor_card_small.dart';
import 'package:farmbroapk/screen/profile.dart';
import 'package:farmbroapk/util/reusable/color.dart';
import 'package:flutter/material.dart';
import '../util/reusable/sensor_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const RemotePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: bottomnav,
          selectedItemColor: Colors.white,
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
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logoayam.png'), fit: BoxFit.cover
              ),
              color: Color(0xFFA16651),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SensorCard(
                    titleCard: 'Suhu Udara',
                    statusCard: 'Normal',
                    valueCard: '24°C',
                    colorBackground: WidgetSuhu,
                    colorFont: fontsuhu
                ),
                const SizedBox(height: 10),
                SensorCard(
                    titleCard: 'Kelembapan Udara',
                    statusCard: 'Normal',
                    valueCard: '55%',
                    colorBackground: WidgetUdara,
                    colorFont: fontkelembapan
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SmallSensorCard(
                        titleCard: 'Gas Amonia',
                        valueCard: '300',
                        colorBackground: widgetgas,
                        colorTitleFont: fontgas,
                        colorValueFont: fontgas
                    ),
                    const SizedBox(width: 10),
                    SmallSensorCard(
                        titleCard: 'Ayam Mati',
                        valueCard: '4',
                        colorBackground: widgetayam,
                        colorTitleFont: Colors.red,
                        colorValueFont: Colors.red
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Diagram Rata Rata',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(1),
                  color: Colors.white,
                  child: const LineChartSample2(), //masih placeholder
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
