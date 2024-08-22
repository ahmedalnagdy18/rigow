import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
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
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/validate_username_entity.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/user_complete_profile/complete_profile_state.dart';
import 'package:rigow/l10n/app_localizations.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage(
      {super.key,
      required this.onPressed,
      required this.firstName,
      required this.lastName});
  final void Function() onPressed;
  final String firstName;
  final String lastName;

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  File? image;
  DateTime? selectedDate;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final TextEditingController _userName = TextEditingController();
  String? selectedGender;

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
                            Icons.verified,
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
                  const SizedBox(height: 40),
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
                        : widget.onPressed,
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
