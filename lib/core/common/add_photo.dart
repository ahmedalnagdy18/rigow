import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({super.key, this.onTap, this.imageFile});
  final Function()? onTap;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: imageFile != null
                  ? FileImage(imageFile!)
                  : const AssetImage('assets/images/addphoto.png')
                      as ImageProvider,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: AppColors.mainRed,
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        )
      ],
    );
  }
}
