import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/login_entity.dart';
import 'package:rigow/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/main_signup.dart';
import 'package:rigow/features/authentication/presentation/screens/login_part/reset_password_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/features/authentication/presentation/widgets/dont_have_acc_part.dart';
import 'package:rigow/features/timeline/timeline_page.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  final String role;

  const LoginPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUsecase: sl()),
      child: _LoginPageBody(role: role),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  final String role;
  const _LoginPageBody({required this.role});

  @override
  State<_LoginPageBody> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPageBody> {
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
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is ErrorLoginState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.message.toString()),
          action: SnackBarAction(
            label: 'Undo',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ));
      }
    }, builder: (context, state) {
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
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
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
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
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
                                  color: AppColors.forgetPassword,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is SucsessLoginState) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TimelinePage()));
                            }
                          },
                          child: ColoredButtonWidget(
                            grideantColors: !_isButtonEnabled
                                ? [AppColors.darkGrey, AppColors.darkGrey]
                                : AppColors.mainRed,
                            onPressed: () {
                              if (_isButtonEnabled) {
                                _loginButton(context);
                              }
                            },
                            text: state is LoadingLoginState
                                ? AppLocalizations.of(context)!.loading
                                : AppLocalizations.of(context)!.next,
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: DontHaveAccPart(
                    redTextOnTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MainSignUpPage(
                                role: widget.role,
                              )));
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
    });
  }

  void _loginButton(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).login(LoginEntity(
        email: _email.text,
        password: _password.text,
        deviceType: 'IOS',
        role: 'USER'));
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
