import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/expert_custom_indicator.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/set_expert_acc_page.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/page4.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/complete_profile_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/select_country_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ExpertMainComplete extends StatelessWidget {
  const ExpertMainComplete(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.role});
  final String firstName;
  final String lastName;
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MainCompleteProfileCubit(completeProfileUserUsecase: sl()),
      child: _ExpertMainComplete(
          firstName: firstName, lastName: lastName, role: role),
    );
  }
}

class _ExpertMainComplete extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String role;

  const _ExpertMainComplete(
      {required this.firstName, required this.lastName, required this.role});

  @override
  State<_ExpertMainComplete> createState() => _ExpertMainCompleteState();
}

class _ExpertMainCompleteState extends State<_ExpertMainComplete> {
  int _currint = 0;
  final PageController _controller = PageController(initialPage: 0);
  String? username;
  String? gender;
  DateTime? birthdate;

  void _onCompleteProfilePagePressed(
      String username, String gender, DateTime birthdate) {
    setState(() {
      this.username = username;
      this.gender = gender;
      this.birthdate = birthdate;
      _controller.jumpToPage(1);
      _currint = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currint == 0 || _currint == 1 || _currint == 3
          ? Colors.white
          : AppColors.grey,
      appBar: AuthenticationAppbar(
        title: AppLocalizations.of(context)!.completeProfile,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              ExpertCustomIndicator(
                currentPage: _currint,
                totalPages: 4,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView(
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
                      onPressed: _onCompleteProfilePagePressed,
                    ),
                    SelectCountryPage(
                      role: widget.role,
                      controller: _controller,
                      firstName: widget.firstName,
                      birthdate: birthdate ?? DateTime.now(),
                      gender: gender ?? "",
                      username: username ?? "",
                    ),
                    const SetExpertAccountPage(),
                    const Page4(),
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
