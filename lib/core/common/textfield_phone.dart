import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phonetextfield extends StatelessWidget {
  const Phonetextfield({super.key, this.focusNode, this.controller});
  final FocusNode? focusNode;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonPadding: const EdgeInsets.only(left: 16),
      controller: controller,
      focusNode: focusNode,
      initialCountryCode: 'EG',
      disableLengthCheck: true,
      dropdownDecoration: const BoxDecoration(
          border:
              Border.symmetric(vertical: BorderSide(color: Color(0xFF9D9C99)))),
      showCountryFlag: false,
      dropdownIconPosition: IconPosition.trailing,
      decoration: const InputDecoration(
        labelText: '  Phone Number',
        labelStyle: TextStyle(
          color: Color(0xFF9D9C99),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 203, 202, 202)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 203, 202, 202)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      languageCode: "EG",
      onChanged: (phone) {},
      onCountryChanged: (country) {},
    );
  }
}
