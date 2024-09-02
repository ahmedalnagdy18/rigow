import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

class MainAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String backText;
  const MainAppbarWidget({
    super.key,
    required this.title,
    required this.backText,
  });

  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.25,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.appBarRed),
      automaticallyImplyLeading: false,
      shadowColor: Colors.black,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () => Navigator.of(context).maybePop(),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Icon(
                size: 18,
                isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
            const SizedBox(width: 3),
            Flexible(
              child: Text(
                backText,
                style: AppTexts.regular.copyWith(color: AppColors.appBarRed),
                maxLines: 1,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
              ),
            ),
          ],
        ),
      ),
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
