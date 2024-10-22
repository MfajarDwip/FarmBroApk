import 'package:farmbroapk/resource/color/mycolor.dart';
import 'package:flutter/material.dart';

class WidgetLampu extends StatelessWidget {
  final bool isLampOn;
  final Function(bool) onToggleLamp;

  const WidgetLampu(
      {super.key, required this.isLampOn, required this.onToggleLamp});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLampOn ? 'Lampu Sudah Menyala Selama' : "",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          isLampOn ? '1 Jam 20 Menit 42 Detik' : 'Lampu Dimatikan',
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onToggleLamp(true);
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: isLampOn ? fontgas : Off,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'ON',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Container(
                      width: 200,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Off, borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onToggleLamp(false);
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: !isLampOn ? buttonOff : Off,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'OFF',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
