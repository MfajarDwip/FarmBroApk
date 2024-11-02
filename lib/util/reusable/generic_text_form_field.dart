import 'package:flutter/material.dart';

class GenericTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String hintText;
  final Widget iconPrefix;
  final Widget? iconSuffix;
  final bool isTextObscure;

  const GenericTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    required this.iconPrefix,
    this.iconSuffix,
    required this.isTextObscure,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isTextObscure,
      keyboardType: textInputType,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black.withAlpha(75)
        ),
        prefixIcon: iconPrefix,
        suffixIcon: iconSuffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0x33FF8A07),
      ),
    );
  }
}
