import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_main_complete.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/main_complete_profile.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/l10n/app_localizations.dart';

class GoogleSignupPage extends StatefulWidget {
  const GoogleSignupPage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.role});
  final String firstName;
  final String lastName;
  final String role;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthenticationAppbar(
        automaticallyImplyLeading: true,
        title: AppLocalizations.of(context)!.signUp,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        onChanged: _isEnabled,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        readOnly: true,
                        mycontroller: _firsName,
                        hintText: widget.firstName,
                        obscureText: false,
                        hintTextColor: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFieldWidget(
                        readOnly: true,
                        mycontroller: _lastName,
                        hintText: widget.lastName,
                        obscureText: false,
                        hintTextColor: Colors.black,
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
                  onPressed: _isButtonEnabled
                      ? () {
                          widget.role == 'Expert'
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ExpertMainComplete(
                                        firstName: widget.firstName,
                                        lastName: widget.lastName,
                                        role: widget.role,
                                      )))
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      MainCompleteYourProfilePage(
                                        firstName: widget.firstName,
                                        lastName: widget.lastName,
                                        role: widget.role,
                                      )));
                        }
                      : null,
                  text: AppLocalizations.of(context)!.next,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _isEnabled() {
    if (_phoneNumber.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
