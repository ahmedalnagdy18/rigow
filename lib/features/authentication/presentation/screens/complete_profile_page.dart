import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/add_photo.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/country_sheet.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController _userName = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Complete your profile ', style: AppTexts.title),
              const Text(
                'Personal info',
                style: AppTexts.miniRegular,
              ),
              const SizedBox(height: 24),
              const Center(
                child: AddPhotoWidget(),
              ),
              const SizedBox(height: 16),
              const Center(child: Text('User Name', style: AppTexts.midTitle)),
              const SizedBox(height: 24),
              TextFieldWidget(
                mycontroller: _userName,
                hintText: 'Username - Ex:ahm987',
                obscureText: false,
                prefixIcon: const Icon(
                  size: 14,
                  Icons.alternate_email,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              const Text('Gender', style: AppTexts.midTitle),
              const SizedBox(height: 24),
              Row(
                children: [
                  CheckBoxWidget(
                    isChecked: isChecked,
                    onTap: (selected) {
                      setState(() {
                        isChecked = true;
                        isChecked2 = false;
                      });
                    },
                  ),
                  const SizedBox(width: 6),
                  const Text('Male', style: AppTexts.miniRegular)
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CheckBoxWidget(
                    isChecked: isChecked2,
                    onTap: (selected) {
                      setState(() {
                        isChecked2 = true;
                        isChecked = false;
                      });
                    },
                  ),
                  const SizedBox(width: 6),
                  const Text('Female', style: AppTexts.miniRegular)
                ],
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
                    hintText: 'Birthdate',
                    suffixText: 'Tap to set',
                    borderColor: AppColors.clickedTextfieldBorder,
                  )),
              const SizedBox(height: 24),
              ColoredButtonWidget(
                  text: 'Next',
                  onPressed: widget.onPressed,
                  grideantColors: AppColors.mainRed,
                  textColor: Colors.white)
            ]),
      ),
    );
  }
}
