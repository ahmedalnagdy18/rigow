import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:rigow/features/authentication/presentation/screens/login_page.dart';

import 'package:rigow/features/authentication/presentation/widgets/dont_have_acc_part.dart';

import 'package:rigow/features/authentication/presentation/widgets/signup_with_email_body.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignupByEmailPage extends StatefulWidget {
  const SignupByEmailPage({super.key, required this.controller});
  final PageController controller;

  @override
  State<SignupByEmailPage> createState() => _SignupByEmailPageState();
}

class _SignupByEmailPageState extends State<SignupByEmailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorRegsisterState) {
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
                        builder: (context) => const LoginPage()));
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
