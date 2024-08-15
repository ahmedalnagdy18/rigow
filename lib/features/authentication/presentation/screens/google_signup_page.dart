import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';
import 'package:rigow/core/fonts/app_text.dart';

class GoogleSignupPage extends StatefulWidget {
  const GoogleSignupPage({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<GoogleSignupPage> createState() => _GoogleSignupPageState();
}

class _GoogleSignupPageState extends State<GoogleSignupPage> {
  final TextEditingController _firsName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  bool isObscuretext = true;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _firsName.dispose();
    _phoneNumber.dispose();
    _lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      onChanged: _isEnabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Sign up with Google', style: AppTexts.title),
          const Text(
            'Complete your account',
            style: AppTexts.miniRegular,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  mycontroller: _firsName,
                  hintText: 'First name',
                  obscureText: false,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFieldWidget(
                  mycontroller: _lastName,
                  hintText: 'Last name',
                  obscureText: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Phonetextfield(
            validator: (value) => _phoneNumber.text.isNotEmpty
                ? null
                : "Please enter your Mobile number",
            controller: _phoneNumber,
          ),
          const SizedBox(height: 24),
          ColoredButtonWidget(
            grideantColors: !_isButtonEnabled
                ? [AppColors.darkGrey, AppColors.darkGrey]
                : AppColors.mainRed,
            onPressed: _isButtonEnabled ? widget.onPressed : null,
            text: 'Next',
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void _isEnabled() {
    if (_firsName.text.isNotEmpty &&
        _lastName.text.isNotEmpty &&
        _phoneNumber.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
