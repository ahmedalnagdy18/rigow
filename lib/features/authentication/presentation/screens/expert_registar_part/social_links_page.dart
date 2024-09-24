import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/social_links_bottom_sheet_widget.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SocialLinksPage extends StatefulWidget {
  final void Function(List<String>? links) getSocialLinks;
  const SocialLinksPage({
    super.key,
    required this.getSocialLinks,
  });

  @override
  State<SocialLinksPage> createState() => _SocialLinksPageState();
}

class _SocialLinksPageState extends State<SocialLinksPage> {
  List<String> socialLinks = [];
  _getIconForLink(String link) {
    if (link.contains("www.facebook.com")) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(
          "assets/images/facebook.png",
          fit: BoxFit.cover,
        ),
      );
    } else if (link.contains("www.instagram.com")) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(
          "assets/images/instagram.png",
          fit: BoxFit.cover,
        ),
      );
    } else if (link.contains("www.youtube.com")) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(
          "assets/images/youtube.png",
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const Icon(
        Icons.link,
        size: 20,
        color: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.socialLinks,
                style: AppTexts.title.copyWith(fontSize: 18),
              ),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context)!.optional,
                style:
                    AppTexts.regular.copyWith(color: AppColors.textfieldBorder),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: socialLinks.map((link) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.backgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: _getIconForLink(link),
                        )),
                    Expanded(
                      child: Text(
                        link,
                        overflow: TextOverflow.ellipsis,
                        style: AppTexts.miniRegular.copyWith(
                          color: AppColors.facebook,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.trash),
                      onPressed: () {
                        setState(() {
                          socialLinks.remove(link);
                          widget.getSocialLinks(socialLinks);
                        });
                      },
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          socialLinks.isNotEmpty
              ? const SizedBox(height: 20)
              : const SizedBox(),
          InkWell(
              onTap: () {
                SocialLinksBottomSheetWidget.show(
                  bottomSheetHintText: 'Past your link here',
                  context,
                  getTextEntyered: (text) {
                    if (socialLinks.length < 5) {
                      setState(() {
                        socialLinks.add(text ?? '');
                        widget.getSocialLinks(socialLinks);
                      });
                      Navigator.pop(context);
                      showToastMessage(
                          message:
                              AppLocalizations.of(context)!.addedSuccessfully);
                    }
                  },
                );
              },
              child: socialLinks.length != 4
                  ? Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 24,
                          color: AppColors.iconAdd,
                        ),
                        const SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.addLink,
                            style: AppTexts.miniRegular
                                .copyWith(color: AppColors.hintText)),
                      ],
                    )
                  : const SizedBox()),
        ],
      ),
    );
  }
}
