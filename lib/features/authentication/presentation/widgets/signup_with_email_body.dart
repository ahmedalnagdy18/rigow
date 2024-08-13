import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';

class SignupWithEmailBody extends StatefulWidget {
  const SignupWithEmailBody({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<SignupWithEmailBody> createState() => _SignupWithEmailBodyState();
}

class _SignupWithEmailBodyState extends State<SignupWithEmailBody> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isObscuretext = true;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _email.dispose();
    _phoneNumber.dispose();
    _password.dispose();
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
          const Text(
            'Sign up with Email',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Text(
            'Enter the required information',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  hintText: 'First name',
                  obscureText: false,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFieldWidget(
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
          const SizedBox(height: 16),
          TextFieldWidget(
            keyboardType: TextInputType.emailAddress,
            validator: (value) => EmailValidator.validate(value!)
                ? null
                : "Please enter a valid email",
            mycontroller: _email,
            hintText: 'Email address',
            obscureText: false,
          ),
          const SizedBox(height: 16),
          TextFieldWidget(
            mycontroller: _password,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscuretext = !isObscuretext;
                });
              },
              child: Icon(
                size: 20,
                isObscuretext ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            hintText: 'Password',
            obscureText: isObscuretext,
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
    bool isEmailValid = EmailValidator.validate(_email.text);
    if (isEmailValid &&
        _email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
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
