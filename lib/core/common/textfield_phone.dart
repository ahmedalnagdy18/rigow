import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:rigow/core/colors/app_colors.dart';

class Phonetextfield extends StatelessWidget {
  const Phonetextfield(
      {super.key,
      this.focusNode,
      this.controller,
      this.validator,
      required this.onCountryChanged});
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final Function(Country) onCountryChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      keyboardType: TextInputType.number,
      flagsButtonPadding: const EdgeInsets.only(left: 16),
      controller: controller,
      focusNode: focusNode,
      //  initialCountryCode: 'EG',
      disableLengthCheck: true,
      dropdownDecoration: const BoxDecoration(
          border:
              Border.symmetric(vertical: BorderSide(color: Color(0xFF9D9C99)))),
      showCountryFlag: false,
      dropdownIconPosition: IconPosition.trailing,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.hintText,
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.textfieldBorder,
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textfieldBorder)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textfieldBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textfieldBorder),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      validator: validator,
      flagsButtonMargin: const EdgeInsets.only(right: 12),
      languageCode: "EG",
      onChanged: (phone) {},
      onCountryChanged: onCountryChanged,
    );
  }
}
