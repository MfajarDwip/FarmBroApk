import 'dart:ffi';

import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; //untuk param function
  final Color colorButton;

  const GenericButton({super.key, required this.text, required this.colorButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
