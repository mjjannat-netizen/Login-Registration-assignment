import 'package:flutter/material.dart';
 
class InputField extends StatelessWidget {
  final controller, keyboardTtpe, labelText, hintText, prefixIcon, validator;
  final bool obscureText; // password hide 
 
  const InputField({
    super.key,
    required this.controller,
    required this.keyboardTtpe,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.obscureText = false,
  });
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardTtpe,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      validator: validator,
    );
  }
}