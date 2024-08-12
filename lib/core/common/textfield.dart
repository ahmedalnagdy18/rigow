import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final int? maxLines;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    this.mycontroller,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      obscureText: obscureText,
      controller: mycontroller,
      validator: validator,
      //  maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(),
          errorStyle: const TextStyle(fontSize: 14),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 203, 202, 202)),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9D9C99),
          )),
    );
  }
}
