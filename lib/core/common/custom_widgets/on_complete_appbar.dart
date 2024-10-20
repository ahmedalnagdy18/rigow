import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

class OnCompleteAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OnCompleteAppbar({
    super.key,
    required this.automaticallyImplyLeading,
    required this.currint,
    required this.onPressed,
  });

  final bool automaticallyImplyLeading;
  final int currint;
  final void Function() onPressed;

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
      leading: currint == 0
          ? null
          : Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(isRtl ? 3.14159 : 0.0),
              child: IconButton(
                icon: Icon(
                    isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
                onPressed: onPressed,
              ),
            ),
      title: Text(
        AppLocalizations.of(context)!.completeProfile,
        style: AppTexts.appBar,
        textAlign: isRtl ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
