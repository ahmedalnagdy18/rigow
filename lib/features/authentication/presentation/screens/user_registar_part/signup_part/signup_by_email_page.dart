import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:rigow/features/authentication/presentation/screens/login_part/login_page.dart';

import 'package:rigow/features/authentication/presentation/widgets/dont_have_acc_part.dart';

import 'package:rigow/features/authentication/presentation/widgets/user_registar_part/signup_part/signup_with_email_body.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignupByEmailPage extends StatefulWidget {
  final String role;
  const SignupByEmailPage(
      {super.key,
      required this.controller,
      required this.onNextTap,
      required this.role});
  final PageController controller;
  final Function(String email) onNextTap;

  @override
  State<SignupByEmailPage> createState() => _SignupByEmailPageState();
}

class _SignupByEmailPageState extends State<SignupByEmailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorRegsisterState) {
          showErrorToastMessage(message: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignupWithEmailBody(
                        controller: widget.controller,
                        onNextTap: widget.onNextTap,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: DontHaveAccPart(
                  redTextOnTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginPage(
                              role: widget.role,
                            )));
                  },
                  blackText: AppLocalizations.of(context)!.alreadyHaveAnAccount,
                  redText: AppLocalizations.of(context)!.logIn,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
