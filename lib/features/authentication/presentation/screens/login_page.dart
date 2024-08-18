import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/main_signup.dart';
import 'package:rigow/features/authentication/presentation/screens/reset_password_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/features/authentication/presentation/widgets/dont_have_acc_part.dart';
import 'package:rigow/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isObscuretext = true;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthenticationAppbar(
        title: AppLocalizations.of(context)!.logIn,
        automaticallyImplyLeading: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: _isEnabled,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 111,
                        height: 33,
                        child: Image.asset(
                          'assets/images/rigow.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        style: AppTexts.title,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.logToYourAccount,
                        style: AppTexts.regular,
                      ),
                      const SizedBox(height: 24),
                      TextFieldWidget(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email",
                        mycontroller: _email,
                        hintText: AppLocalizations.of(context)!.emailAddress,
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
                            isObscuretext
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText: AppLocalizations.of(context)!.password,
                        obscureText: isObscuretext,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordPage()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgetPassword,
                            style: AppTexts.medium.copyWith(
                                color: AppColors.forgetPassword, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ColoredButtonWidget(
                        grideantColors: !_isButtonEnabled
                            ? [AppColors.darkGrey, AppColors.darkGrey]
                            : AppColors.mainRed,
                        onPressed: _isButtonEnabled ? () {} : null,
                        text: AppLocalizations.of(context)!.next,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: DontHaveAccPart(
                  redTextOnTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainSignUpPage()));
                  },
                  blackText: AppLocalizations.of(context)!.dontHaveAcc,
                  redText: AppLocalizations.of(context)!.signUp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _isEnabled() {
    bool isEmailValid = EmailValidator.validate(_email.text);
    if (isEmailValid && _email.text.isNotEmpty && _password.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
