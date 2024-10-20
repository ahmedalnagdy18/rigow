import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/add_photo.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/validate_username_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_state.dart';
import 'package:rigow/features/authentication/presentation/widgets/select_file_sheet_widget.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage(
      {super.key,
      required this.onPressed,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.bioText,
      required this.onSelectedImage});
  final void Function(String bioText, String username, UserGenderEnum gender,
      DateTime birthdate) onPressed;
  final String bioText;
  final String firstName;
  final void Function(File? selectedImage) onSelectedImage;
  final String lastName;
  final String role;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteProfileCubit(
          validateUsernameUsecase: sl(), uploadFileUsecase: sl()),
      child: _CompleteProfilePage(
        firstName: firstName,
        lastName: lastName,
        onSelectedImage: onSelectedImage,
        onPressed: onPressed,
        role: role,
        bioText: bioText,
      ),
    );
  }
}

class _CompleteProfilePage extends StatefulWidget {
  const _CompleteProfilePage(
      {required this.onPressed,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.bioText,
      required this.onSelectedImage});
  final void Function(String bioText, String username, UserGenderEnum gender,
      DateTime birthdate) onPressed;
  final String bioText;
  final String firstName;
  final void Function(File? selectedImage) onSelectedImage;
  final String lastName;
  final String role;

  @override
  State<_CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<_CompleteProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  File? image;
  File? pdf;
  DateTime? selectedDate;

  Future getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File pdfFile = File(result.files.single.path!);
      widget.onSelectedImage(pdfFile);
      setState(() => pdf = pdfFile);
    } else {
      return;
    }
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    widget.onSelectedImage(imageTemp);
    setState(() => this.image = imageTemp);
    _isEnabled();
  }

  Future takeImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final takeImage = File(image.path);
    setState(() => this.image = takeImage);
    _isEnabled();
  }

  final TextEditingController _userName = TextEditingController();
  UserGenderEnum? selectedGender;
  final bioText = TextEditingController();
  bool _isButtonEnabled = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: _isEnabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.completeYourProfile,
                            style: AppTexts.title),
                        const SizedBox(height: 8),
                        Text(AppLocalizations.of(context)!.personalInfo,
                            style: AppTexts.miniRegular),
                        const SizedBox(height: 24),
                        Center(
                            child: AddPhotoWidget(
                          role: widget.role,
                          imageFile: image,
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return SelectFileSheetWidget(
                                    cameraTap: () {
                                      takeImage();
                                      Navigator.pop(context);
                                    },
                                    pdfTap: () {
                                      getPdf();
                                      Navigator.pop(context);
                                    },
                                    onTap: () {
                                      pickImage();
                                      Navigator.pop(context);
                                    },
                                    isProfile: true,
                                  );
                                });
                          },
                        )),
                        const SizedBox(height: 16),
                        Center(
                            child: Text(
                                '${widget.firstName} ${widget.lastName}',
                                style: AppTexts.midTitle)),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          suffixIcon: state is SucsessValidateUsernameState
                              ? Icon(
                                  Icons.check_circle,
                                  color: AppColors.appBarRed,
                                  size: 16,
                                )
                              : null,
                          errorStyle:
                              TextStyle(color: AppColors.errorOrangeColor),
                          onChanged: (value) {
                            BlocProvider.of<CompleteProfileCubit>(context)
                                .validateUsername(
                                    ValidateUsernameInput(username: value));
                          },
                          validator: (value) {
                            final state =
                                BlocProvider.of<CompleteProfileCubit>(context)
                                    .state;

                            if (state is ErrorValidateUsernameState &&
                                _userName.text.isNotEmpty) {
                              return state.message;
                            }
                            return null;
                          },
                          mycontroller: _userName,
                          hintText: 'Username - Ex:ahm987',
                          obscureText: false,
                          maxLength: 24,
                          counterText: '',
                          prefixIcon: const Icon(
                            Icons.alternate_email,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(AppLocalizations.of(context)!.gender,
                            style: AppTexts.midTitle),
                        const SizedBox(height: 16),
                        CheckBoxWidget(
                          value: UserGenderEnum.male,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });

                            _isEnabled();
                          },
                          title: AppLocalizations.of(context)!.male,
                        ),
                        const SizedBox(height: 8),
                        CheckBoxWidget(
                          value: UserGenderEnum.female,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });

                            _isEnabled();
                          },
                          title: AppLocalizations.of(context)!.female,
                        ),
                        SizedBox(height: widget.role == 'Expert' ? 40 : 0),
                        widget.role == 'Expert'
                            ? Text(
                                AppLocalizations.of(context)!.biography,
                                style: AppTexts.midTitle,
                              )
                            : const SizedBox(),
                        const SizedBox(height: 16),
                        widget.role == 'Expert'
                            ? TextFieldWidget(
                                inputFormatters: [
                                  noSpaceFormatter(),
                                ],
                                validator: (value) {
                                  if (widget.role == 'Expert' &&
                                      bioText.text.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                                mycontroller: bioText,
                                obscureText: false,
                                hintText: AppLocalizations.of(context)!
                                    .tellAboutYourSelf,
                                maxLength: 600,
                              )
                            : const SizedBox(),
                        const SizedBox(height: 32),
                        InkWell(
                          onTap: () {
                            _openDatePicker(context);
                          },
                          child: ClikedTextFieldWidget(
                            hintText: AppLocalizations.of(context)!.birthdate,
                            suffixText: selectedDate != null
                                ? _formatDate(selectedDate!)
                                : AppLocalizations.of(context)!.tapToSet,
                            borderColor: selectedDate != null
                                ? Colors.transparent
                                : AppColors.clickedTextfieldBorder,
                            color: selectedDate != null
                                ? AppColors.lightGrey
                                : null,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
              ColoredButtonWidget(
                text: state is LoadingUploadFileState
                    ? AppLocalizations.of(context)!.loading
                    : AppLocalizations.of(context)!.next,
                onPressed: _isButtonEnabled && _formKey.currentState!.validate()
                    ? () async {
                        //   final path = await _uploadPhoto(context);
                        setState(() {
                          widget.onSelectedImage(File(image?.path ?? ""));
                        });

                        widget.onPressed(
                          bioText.text,
                          _userName.text,
                          selectedGender!,
                          selectedDate!,
                        );
                      }
                    : null,
                grideantColors:
                    _isButtonEnabled && _formKey.currentState!.validate()
                        ? AppColors.mainRed
                        : [AppColors.darkGrey, AppColors.darkGrey],
                textColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<String> _uploadPhoto(BuildContext context) async {
  //   final filePath =
  //       await BlocProvider.of<CompleteProfileCubit>(context).uploadFile(
  //     UploadFiledInput(
  //       file: image?.path ?? "",
  //       model: "PROFILE_PICTURE",
  //     ),
  //   );
  //   return filePath;
  // }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: const SizedBox(),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: selectedDate,
      maxDateTime: DateTime.now(),
      minDateTime: DateTime(1970),
      pickerTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      onChange: (date) {},
      onSubmit: (date) {
        setState(() {
          selectedDate = date;
        });

        _isEnabled();
      },
      buttonContent: Center(
        child: RedText(
          text: 'Add',
          gradient: LinearGradient(colors: AppColors.mainRed),
        ),
      ),
      buttonAlignment: MainAxisAlignment.end,
      buttonSingleColor: Colors.transparent,
    ).show(context);
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  void _isEnabled() {
    setState(() {
      if (image?.path != null &&
              selectedGender != null &&
              selectedDate != null &&
              _userName.text.isNotEmpty
          // &&
          // bioText.text.isNotEmpty
          ) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }
}
