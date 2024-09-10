import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/add_photo.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/validate_username_entity.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_state.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage(
      {super.key,
      required this.onPressed,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.bioText});
  final void Function(
          String bioText, String username, String gender, DateTime birthdate)
      onPressed;
  final String bioText;
  final String firstName;

  final String lastName;
  final String role;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteProfileCubit(validateUsernameUsecase: sl()),
      child: _CompleteProfilePage(
        firstName: firstName,
        lastName: lastName,
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
      required this.bioText});
  final void Function(
          String bioText, String username, String gender, DateTime birthdate)
      onPressed;
  final String bioText;
  final String firstName;
  final String lastName;
  final String role;

  @override
  State<_CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<_CompleteProfilePage> {
  File? image;
  DateTime? selectedDate;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  }

  final TextEditingController _userName = TextEditingController();
  String? selectedGender;
  final bioText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
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
                    imageFile: image,
                    onTap: () {
                      pickImage();
                    },
                  )),
                  const SizedBox(height: 16),
                  Center(
                      child: Text('${widget.firstName} ${widget.lastName}',
                          style: AppTexts.midTitle)),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    suffixIcon: state is SucsessValidateUsernameState
                        ? Icon(
                            Icons.check_circle,
                            color: AppColors.appBarRed,
                            size: 16,
                          )
                        : null,
                    errorStyle: TextStyle(color: AppColors.errorOrangeColor),
                    onChanged: (value) {
                      BlocProvider.of<CompleteProfileCubit>(context)
                          .validateUsername(
                              ValidateUsernameEntity(username: value));
                    },
                    validator: (value) {
                      final state =
                          BlocProvider.of<CompleteProfileCubit>(context).state;

                      if (state is ErrorValidateUsernameState) {
                        return state.message;
                      }
                      return null;
                    },
                    mycontroller: _userName,
                    hintText: 'Username - Ex:ahm987',
                    obscureText: false,
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
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    title: AppLocalizations.of(context)!.male,
                  ),
                  CheckBoxWidget(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
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
                          mycontroller: bioText,
                          obscureText: false,
                          hintText:
                              AppLocalizations.of(context)!.tellAboutYourSelf,
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
                      color: selectedDate != null ? AppColors.lightGrey : null,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ColoredButtonWidget(
                    text: AppLocalizations.of(context)!.next,
                    onPressed: (state is ErrorValidateUsernameState ||
                            selectedGender == null ||
                            _userName.text.isEmpty ||
                            selectedDate == null)
                        ? null
                        : () {
                            widget.onPressed(
                              bioText.text,
                              _userName.text,
                              selectedGender!,
                              selectedDate!,
                            );
                          },
                    grideantColors: AppColors.mainRed,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: const SizedBox(),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(2018),
      minDateTime: DateTime(1980),
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
}
