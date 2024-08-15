import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/reset_password_verifcation.dart';
import 'package:rigow/features/authentication/presentation/widgets/reset_password_appbar.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _email = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ResetPasswordAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: _isEnabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Reset your Password', style: AppTexts.title),
              const SizedBox(height: 8),
              const Text(
                'We’ll confirm your account by sending a verification code to your email address.',
                style: AppTexts.regular,
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
              const SizedBox(height: 24),
              ColoredButtonWidget(
                grideantColors: !_isButtonEnabled
                    ? [AppColors.darkGrey, AppColors.darkGrey]
                    : AppColors.mainRed,
                onPressed: _isButtonEnabled
                    ? () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                const ResetPasswordVerifcation()));
                      }
                    : null,
                text: 'Next',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _isEnabled() {
    bool isEmailValid = EmailValidator.validate(_email.text);
    if (isEmailValid && _email.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
