import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

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
          Text(AppLocalizations.of(context)!.signupWithGoogle,
              style: AppTexts.title),
          Text(
            AppLocalizations.of(context)!.completeYourAccount,
            style: AppTexts.miniRegular,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  mycontroller: _firsName,
                  hintText: AppLocalizations.of(context)!.firstName,
                  obscureText: false,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFieldWidget(
                  mycontroller: _lastName,
                  hintText: AppLocalizations.of(context)!.lastName,
                  obscureText: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Phonetextfield(
            initialCountryCode: 'EG',
            onCountryChanged: (p0) {},
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
            text: AppLocalizations.of(context)!.next,
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
