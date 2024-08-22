import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/custom_indicator.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/screens/complete_profile_page.dart';
import 'package:rigow/features/authentication/presentation/screens/select_country_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class MainCompleteYourProfilePage extends StatelessWidget {
  const MainCompleteYourProfilePage(
      {super.key, required this.firstName, required this.lastName});
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteProfileCubit(validateUsernameUsecase: sl()),
      child: _MainCompleteYourProfilePage(
          firstName: firstName, lastName: lastName),
    );
  }
}

class _MainCompleteYourProfilePage extends StatefulWidget {
  final String firstName;
  final String lastName;
  const _MainCompleteYourProfilePage(
      {required this.firstName, required this.lastName});

  @override
  State<_MainCompleteYourProfilePage> createState() =>
      _MainCompleteYourProfilePageState();
}

class _MainCompleteYourProfilePageState
    extends State<_MainCompleteYourProfilePage> {
  int _currint = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthenticationAppbar(
        title: AppLocalizations.of(context)!.completeProfile,
        automaticallyImplyLeading: false,
      ),
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
                    CompleteProfilePage(
                      firstName: widget.firstName,
                      lastName: widget.lastName,
                      onPressed: () {
                        _controller.jumpToPage(1);

                        setState(() {
                          _currint = 1;
                        });
                      },
                    ),
                    const SelectCountryPage(),
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
