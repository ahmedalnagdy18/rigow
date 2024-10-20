import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/custom_indicator.dart';
import 'package:rigow/core/common/custom_widgets/on_complete_appbar.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/complete_profile_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/select_country_page.dart';
import 'package:rigow/injection_container.dart';

class MainCompleteYourProfilePage extends StatelessWidget {
  const MainCompleteYourProfilePage(
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
      create: (context) => MainCompleteProfileCubit(
          completeProfileUserUsecase: sl(), uploadFileUsecase: sl()),
      child: _MainCompleteYourProfilePage(
        firstName: firstName,
        lastName: lastName,
        role: role,
      ),
    );
  }
}

class _MainCompleteYourProfilePage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String role;
  const _MainCompleteYourProfilePage(
      {required this.firstName, required this.lastName, required this.role});

  @override
  State<_MainCompleteYourProfilePage> createState() =>
      _MainCompleteYourProfilePageState();
}

class _MainCompleteYourProfilePageState
    extends State<_MainCompleteYourProfilePage> {
  int _currint = 0;
  final PageController _controller = PageController(initialPage: 0);
  String? username;
  UserGenderEnum? gender;
  DateTime? birthdate;
  String? imageOfprofile;

  void _onCompleteProfilePagePressed(String bioText, String username,
      UserGenderEnum gender, DateTime birthdate) {
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
      backgroundColor: Colors.white,
      appBar: OnCompleteAppbar(
        automaticallyImplyLeading: _currint == 0 ? false : true,
        currint: _currint,
        onPressed: () {
          if (_currint > 0) {
            _controller.previousPage(
                duration: const Duration(microseconds: 300),
                curve: Curves.easeIn);
          }
        },
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
                      onSelectedImage: (selectedImage) async {
                        setState(() {
                          imageOfprofile = selectedImage?.path;
                        });
                      },
                      bioText: '',
                      role: widget.role,
                      firstName: widget.firstName,
                      lastName: widget.lastName,
                      onPressed: _onCompleteProfilePagePressed,
                    ),
                    SelectCountryPage(
                      imageOfprofile: imageOfprofile ?? 'dd',
                      controller: _controller,
                      role: widget.role,
                      firstName: widget.firstName,
                      birthdate: birthdate ?? DateTime.now(),
                      gender: gender ?? UserGenderEnum.male,
                      username: username ?? "",
                      onNextPressed: (int countryId, int cityId, int areaId) {},
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
