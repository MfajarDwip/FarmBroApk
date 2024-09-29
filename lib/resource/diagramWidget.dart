import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farmbroapk/resource/color/mycolor.dart';

class diagramCard extends StatelessWidget {
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
          color: Colors.white,
          child: Stack(children: [
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                'suhu',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
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
                      color: Colors.blue),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
