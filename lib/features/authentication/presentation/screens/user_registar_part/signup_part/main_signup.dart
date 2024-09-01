import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/custom_indicator.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/signup_by_email_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/verification_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class MainSignUpPage extends StatelessWidget {
  final String role;
  const MainSignUpPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          registerUsecase: sl(), sendEmailVerificationCodeUsecase: sl()),
      child: _MainSignUpPage(role: role),
    );
  }
}

class _MainSignUpPage extends StatefulWidget {
  final String role;
  const _MainSignUpPage({required this.role});

  @override
  State<_MainSignUpPage> createState() => _MainSignUpPageState();
}

class _MainSignUpPageState extends State<_MainSignUpPage> {
  int _currint = 0;
  final PageController _controller = PageController(initialPage: 0);
  String? _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthenticationAppbar(
        title: AppLocalizations.of(context)!.signUp,
        automaticallyImplyLeading: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              CustomIndicator(
                colors:
                    _currint == 1 ? AppColors.mainRed : AppColors.greyLoader,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  onPageChanged: (int value) {
                    setState(() {
                      _currint = value;
                    });
                  },
                  children: [
                    SignupByEmailPage(
                      role: widget.role,
                      controller: _controller,
                      onNextTap: (email) {
                        setState(() {
                          _email = email;
                        });
                        _controller.jumpToPage(1);
                      },
                    ),
                    VerificationPage(
                      role: widget.role,
                      onTap: () {
                        _controller.jumpToPage(0);

                        setState(() {
                          _currint = 0;
                        });
                      },
                      email: _email ?? "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
