import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farmbroapk/resource/color/mycolor.dart';

class Widgetsuhu extends StatelessWidget {
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
          color: WidgetSuhu,
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
                          'Suhu udara',
                          style: TextStyle(
                            fontSize: 20,
                            color: fontsuhu,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'Normal',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: fontsuhu
                          ),
                        ),
                      ],
                    ),
                    // Angka di sebelah kanan
                    Text(
                      '24C',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontsuhu,
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