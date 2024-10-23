import 'package:farmbroapk/util/reusable/generic_button.dart';
import 'package:farmbroapk/util/reusable/generic_text_form_field.dart';
import 'package:flutter/material.dart';

//FIXME: convert to bloc
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sizedBoxSize = screenSize.height/15;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF99613C),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: sizedBoxSize),
              SizedBox(
                height: screenSize.height - sizedBoxSize,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 28),
                        const Text(
                          'Edit Akun',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GenericTextFormField(
                          hintText: 'Password lama',
                          iconPrefix: const Icon(Icons.lock_outline),
                          isTextObscure: true,
                          onChanged: (String value) {
                          },
                        ),
                        const SizedBox(height: 20),
                        GenericTextFormField(
                          hintText: 'Password baru',
                          iconPrefix: const Icon(Icons.lock),
                          isTextObscure: true,
                          onChanged: (String value) {
                          },
                        ),
                        const SizedBox(height: 20),
                        GenericTextFormField(
                          hintText: 'Konfirmasi password baru',
                          iconPrefix: const Icon(Icons.lock_reset),
                          isTextObscure: true,
                          onChanged: (String value) {
                          },
                        ),
                        const SizedBox(height: 20),
                        GenericButton(
                          text: 'UBAH',
                          colorButton: Colors.orange,
                          onPressed: (){

                          }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
