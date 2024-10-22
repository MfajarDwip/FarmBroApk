import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  final String titleCard;
  final String statusCard;
  final String valueCard;
  final Color colorBackground;
  final Color colorFont;

  const SensorCard({super.key, required this.titleCard, required this.statusCard, required this.valueCard, required this.colorBackground, required this.colorFont,});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      shadowColor: Colors.black.withOpacity(1),
      color: colorBackground,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleCard,
                      style: TextStyle(
                          fontSize: 20,
                          color: colorFont,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      statusCard,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colorFont
                      ),
                    ),
                  ],
                ),
                Text(
                  valueCard,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: colorFont,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
