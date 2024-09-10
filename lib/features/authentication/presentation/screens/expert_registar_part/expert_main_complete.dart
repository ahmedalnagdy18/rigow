import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/expert_custom_indicator.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/set_expert_acc_page.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_polices.dart';
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
  String? bioText;
  String? username;
  String? gender;
  DateTime? birthdate;
  // ******************
  int? _countryId;
  int? _statesId;
  int? _areaId;
  int? _specialityId;
  int? _facultyId;
  int? _departmentId;
  String? _universityImage;
  String? _universityName;
  String? _otherCertificationsImage;
  String? _governmentPermitImage;
  String? _nationalFrontId;
  String? _nationalBackId;
  String? _fullNameInNationalId;
  String? _nationalIdNumber;
  List<String>? _socialLinks;
  void _onCompleteProfilePagePressed(
      String bioText, String username, String gender, DateTime birthdate) {
    setState(() {
      this.bioText = bioText;
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
          : AppColors.backgroundColor,
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
                      bioText: bioText ?? 'error to get bio',
                      role: widget.role,
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
                      onNextPressed: (int countryId, int cityId, int areaId) {
                        _countryId = countryId;
                        _statesId = cityId;
                        _areaId = areaId;
                      },
                    ),
                    SetExpertAccountPage(
                      onNextPressed: (dataInfo) {
                        _specialityId = dataInfo.specialityId;
                        _facultyId = dataInfo.facultyId;
                        _departmentId = dataInfo.departmentId;
                        _universityImage = dataInfo.universityImage;
                        _universityName = dataInfo.universityName;
                        _otherCertificationsImage =
                            dataInfo.otherCertificationsImage;
                        _governmentPermitImage = dataInfo.governmentPermitImage;
                        _nationalFrontId = dataInfo.nationalFrontId;
                        _nationalBackId = dataInfo.nationalBackId;
                        _fullNameInNationalId = dataInfo.fullNameInNationalId;
                        _nationalIdNumber = dataInfo.nationalIdNumber;
                        _socialLinks = dataInfo.socialLinks;
                        _controller.jumpToPage(3);
                      },
                    ),
                    ExpertPolicesPage(
                      bioText: bioText ?? '',
                      username: username ?? "",
                      gender: gender ?? "",
                      birthdate: birthdate ?? DateTime.now(),
                      countryId: _countryId ?? 0,
                      statesId: _statesId ?? 0,
                      areaId: _areaId ?? 0,
                      specialityId: _specialityId ?? 0,
                      facultyId: _facultyId ?? 0,
                      departmentId: _departmentId ?? 0,
                      universityImage: _universityImage ?? '',
                      universityName: _universityName ?? '',
                      otherCertificationsImage: _otherCertificationsImage ?? '',
                      governmentPermitImage: _governmentPermitImage ?? '',
                      nationalFrontId: _nationalFrontId ?? '',
                      nationalBackId: _nationalBackId ?? '',
                      fullNameInNationalId: _fullNameInNationalId ?? '',
                      nationalIdNumber: _nationalIdNumber ?? '',
                      socialLinks: _socialLinks ?? [],
                      firstName: widget.firstName,
                      role: widget.role,
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
