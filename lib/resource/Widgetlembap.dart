import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farmbroapk/resource/color/mycolor.dart';

class KelembapanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(1),
          color: WidgetUdara,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Mengatur semua anak ke kiri
              children: [
                // Row untuk Kelembapan Udara dan Angka
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Teks di kiri
                      children: [
                        Text(
                          'Kelembapan Udara',
                          style: TextStyle(
                            fontSize: 20,
                            color: fontkelembapan,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'Normal',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: fontkelembapan
                          ),
                        ),
                      ],
                    ),
                    // Angka di sebelah kanan
                    Text(
                      '55%',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontkelembapan,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}