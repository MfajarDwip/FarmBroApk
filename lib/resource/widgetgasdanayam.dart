import 'package:farmbroapk/resource/color/mycolor.dart';
import 'package:flutter/material.dart';

class ayamdangasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Card pertama (kiri)
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(1),
                  color: widgetgas, // Ganti warna card sesuai kebutuhan
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Text(
                          'Gas Amonia',
                          style: TextStyle(
                            fontSize: 20,
                            color: fontgas,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Text(
                            '300',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: fontgas),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Card kedua (kanan)
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(1),
                  color: widgetayam, // Ganti warna card sesuai kebutuhan
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Text(
                          'Ayam Mati',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(43),
                          child: Text(
                            '4',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
