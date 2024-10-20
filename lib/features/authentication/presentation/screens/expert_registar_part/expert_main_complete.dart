import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/custom_widgets/on_complete_appbar.dart';
import 'package:rigow/core/common/expert_custom_indicator.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/set_expert_acc_page.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_polices.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/complete_profile_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/select_country_page.dart';
import 'package:rigow/injection_container.dart';

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
      create: (context) => MainCompleteProfileCubit(
          completeProfileUserUsecase: sl(), uploadFileUsecase: sl()),
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
  String? imageOfprofile;
  String? bioText;
  String? username;
  UserGenderEnum? gender;
  DateTime? birthdate;
  // ******************
  int? _countryId;
  int? _statesId;
  int? _areaId;
  int? _specialityId;
  int? _facultyId;
  String? _customFaculty;
  int? _departmentId;
  String? _customDepartment;
  String? _universityImage;
  String? _universityName;
  String? _otherCertificationsImage;
  String? _governmentPermitImage;
  String? _nationalFrontId;
  String? _nationalBackId;
  String? _fullNameInNationalId;
  String? _nationalIdNumber;
  List<String>? _socialLinks;
  void _onCompleteProfilePagePressed(String bioText, String username,
      UserGenderEnum gender, DateTime birthdate) {
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
      //  AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.25,
      //   automaticallyImplyLeading: _currint == 0 ? false : true,
      //   shadowColor: Colors.black,
      //   iconTheme: IconThemeData(
      //     color: AppColors.appBarRed,
      //   ),
      //   leading: _currint == 0
      //       ? null
      //       : Transform(
      //           alignment: Alignment.center,
      //           transform: Matrix4.rotationY(isRtl ? 3.14159 : 0.0),
      //           child: IconButton(
      //             icon: Icon(
      //                 isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
      //             onPressed: () {
      //               if (_currint > 0) {
      //                 _controller.previousPage(
      //                     duration: const Duration(microseconds: 300),
      //                     curve: Curves.easeIn);
      //               }
      //             },
      //           ),
      //         ),
      //   title: Text(
      //     AppLocalizations.of(context)!.completeProfile,
      //     style: AppTexts.appBar,
      //     textAlign: isRtl ? TextAlign.right : TextAlign.left,
      //   ),
      // ),
      // AuthenticationAppbar(
      //   title: AppLocalizations.of(context)!.completeProfile,
      //   automaticallyImplyLeading: false,
      // ),
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
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (int value) {
                    setState(() {
                      _currint = value;
                    });
                  },
                  children: [
                    CompleteProfilePage(
                      onSelectedImage: (selectedImage) {
                        imageOfprofile = selectedImage?.path;
                        setState(() {});
                      },
                      bioText: bioText ?? '',
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
                      gender: gender ?? UserGenderEnum.male,
                      username: username ?? "",
                      onNextPressed: (int countryId, int cityId, int areaId) {
                        _countryId = countryId;
                        _statesId = cityId;
                        _areaId = areaId;
                      },
                      imageOfprofile: imageOfprofile ?? "dd",
                    ),
                    SetExpertAccountPage(
                      onNextPressed: (dataInfo) {
                        _customFaculty = dataInfo.customFaculty;
                        _customDepartment = dataInfo.customDepartment;
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
                      onSendRequestPressed: () {
                        _controller.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      customDepartment: _customDepartment ?? "",
                      customfaculty: _customFaculty ?? "",
                      bioText: bioText ?? '',
                      username: username ?? "",
                      gender: gender ?? UserGenderEnum.male,
                      birthdate:
                          (birthdate ?? DateTime.now()).millisecondsSinceEpoch,
                      countryId: _countryId ?? 0,
                      statesId: _statesId ?? 0,
                      areaId: _areaId ?? 0,
                      specialityId: _specialityId ?? 0,
                      facultyId: _facultyId ?? -1,
                      departmentId: _departmentId ?? -1,
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
                      imageOfprofile: imageOfprofile ?? "dd",
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
