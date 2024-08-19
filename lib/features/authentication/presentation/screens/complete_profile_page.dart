import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/add_photo.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/country_sheet.dart';
import 'package:rigow/l10n/app_localizations.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController _userName = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.completeYourProfile,
                style: AppTexts.title),
            const SizedBox(height: 8),
            Text(AppLocalizations.of(context)!.personalInfo,
                style: AppTexts.miniRegular),
            const SizedBox(height: 24),
            const Center(child: AddPhotoWidget()),
            const SizedBox(height: 16),
            const Center(child: Text('User Name', style: AppTexts.midTitle)),
            const SizedBox(height: 24),
            TextFieldWidget(
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
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const CountrySheet();
                  },
                );
              },
              child: ClikedTextFieldWidget(
                hintText: AppLocalizations.of(context)!.birthdate,
                suffixText: AppLocalizations.of(context)!.tapToSet,
                borderColor: AppColors.clickedTextfieldBorder,
              ),
            ),
            const SizedBox(height: 24),
            ColoredButtonWidget(
              text: AppLocalizations.of(context)!.next,
              onPressed: widget.onPressed,
              grideantColors: AppColors.mainRed,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
