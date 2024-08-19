import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

class AuthenticationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AuthenticationAppbar({
    super.key,
    required this.title,
    required this.automaticallyImplyLeading,
  });

  final String title;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.25,
      automaticallyImplyLeading: automaticallyImplyLeading,
      shadowColor: Colors.black,
      iconTheme: IconThemeData(
        color: AppColors.appBarRed,
      ),
      leading: automaticallyImplyLeading
          ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(isRtl ? 3.14159 : 0.0),
              child: IconButton(
                icon: Icon(
                    isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          : null,
      title: Text(
        title,
        style: AppTexts.appBar,
        textAlign: isRtl ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
