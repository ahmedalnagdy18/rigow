import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget(
      {super.key, this.onTap, this.imageFile, required this.role});
  final Function()? onTap;
  final File? imageFile;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
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
            role == 'Expert'
                ? Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.verified,
                        color: Color(0xffE0E0E0),
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: InkWell(
            onTap: onTap,
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
          ),
        )
      ],
    );
  }
}
