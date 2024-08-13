import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, required this.controller, this.onCompleted});
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: onCompleted,
      controller: controller,
      preFilledWidget: const Text(
        '_',
        style: TextStyle(color: Colors.grey),
      ),
      errorText: 'The code is not valid',
      errorTextStyle: const TextStyle(
        color: Colors.red,
      ),
      defaultPinTheme: PinTheme(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey,
            ),
          )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      length: 4,
      focusedPinTheme: PinTheme(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black,
            ),
          )),
      textInputAction: TextInputAction.next,
    );
  }
}
