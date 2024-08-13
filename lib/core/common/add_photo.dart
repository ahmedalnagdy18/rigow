import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/addphoto.png'),
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
