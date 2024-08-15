import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

class ResetPasswordAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ResetPasswordAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.25,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.appBarRed),
      automaticallyImplyLeading: false,
      shadowColor: Colors.black,
      leadingWidth: 100,
      leading: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
            ),
          ),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              'Log in',
              style: AppTexts.regular.copyWith(color: AppColors.appBarRed),
              maxLines: 1,
            ),
          ),
        ],
      ),
      title: const Text(
        'Reset Password',
        style: AppTexts.appBar,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
