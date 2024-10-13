import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonGeneric extends StatelessWidget {
  final String text;
  final String? getRoute; //untuk param navigasi screen
  final VoidCallback? onPressed; //untuk param function
  final Color colorButton;

  const ButtonGeneric({super.key, required this.text, this.getRoute, required this.colorButton, this.onPressed});

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
        onPressed: () {
          (getRoute!.isNotEmpty) ? Get.toNamed(getRoute!) : onPressed; //pilih salah satu dari getRoute atau onPressed
        },
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
