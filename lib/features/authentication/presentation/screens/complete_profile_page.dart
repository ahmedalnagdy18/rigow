import 'package:flutter/material.dart';
import 'package:rigow/core/common/add_photo.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
            Center(
                child: Text('User Name',
                    style: AppTexts.medium.copyWith(fontSize: 16))),
            const SizedBox(height: 24),
            const TextFieldWidget(hintText: 'hintText', obscureText: false)
          ]),
    );
  }
}
