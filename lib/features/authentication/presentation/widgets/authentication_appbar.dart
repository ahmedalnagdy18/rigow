import 'package:flutter/material.dart';
import 'package:rigow/core/fonts/app_text.dart';

class AuthenticationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AuthenticationAppbar(
      {super.key,
      required this.title,
      required this.automaticallyImplyLeading});

  final String title;
  final bool automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.25,
      automaticallyImplyLeading: automaticallyImplyLeading,
      shadowColor: Colors.black,
      title: Text(
        title,
        style: AppTexts.appBar,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
