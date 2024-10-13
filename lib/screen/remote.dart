import 'dart:ffi';

import 'package:flutter/material.dart';

class RemotePage extends StatefulWidget {
  const RemotePage({super.key});

  @override
  State<RemotePage> createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final boxSize = screenSize.width/2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFF8A07),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              setState(() {

              });
            },
            child: const Text(
              'ON',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Divider(
          indent: boxSize/2,
          endIndent: boxSize/2,
          thickness: 1,
          color: Colors.black12,
        ),
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFF8A07),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              setState(() {

              });
            },
            child: const Text(
              'OFF',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}
