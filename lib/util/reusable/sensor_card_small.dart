import 'package:flutter/material.dart';

class SmallSensorCard extends StatelessWidget {

  final String titleCard;
  final String valueCard;
  final Color colorBackground;
  final Color colorTitleFont;
  final Color colorValueFont;

  const SmallSensorCard({super.key, required this.titleCard, required this.valueCard, required this.colorBackground, required this.colorTitleFont, required this.colorValueFont});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(1),
        color: colorBackground,
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                titleCard,
                style: TextStyle(
                    fontSize: 20,
                    color: colorTitleFont,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  valueCard,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: colorValueFont),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
