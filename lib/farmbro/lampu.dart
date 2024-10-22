import 'package:flutter/material.dart';
import 'package:farmbroapk/resource/WidgetLampu.dart';

class Lampu extends StatefulWidget {
  const Lampu({super.key});

  @override
  State<Lampu> createState() => _LampuState();
}

class _LampuState extends State<Lampu> {
  bool isLampOn = false;
  int _selectedIndex = 0;

  void _toggleLamp(bool turnOn) {
    setState(() {
      isLampOn = turnOn;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetLampu(
        isLampOn: isLampOn,
        onToggleLamp: _toggleLamp,
      ),
    );
  }
}
