import 'package:flutter/material.dart';

class AuthenticationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AuthenticationAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.25,
      shadowColor: Colors.black,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
