import 'package:farmbroapk/util/reusable/chart.dart';
import 'package:farmbroapk/util/reusable/sensor_card_small.dart';
import 'package:farmbroapk/util/reusable/color.dart';
import 'package:flutter/material.dart';
import '../../util/reusable/sensor_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // TODO: implement state management
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
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
                padding: EdgeInsets.only(bottom: screenSize.width/15),
                child: const Text(
                  'Selamat Datang, Atmin',
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(1),
                  color: Colors.white,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 10),
                        child: Text(
                          'Diagram Rata Rata',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      LineChartSample2(),
                    ],
                  ), //masih placeholder
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
