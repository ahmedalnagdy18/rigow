import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/addto_buttom_sheet_widget.dart';

class SocialLinksPage extends StatefulWidget {
  const SocialLinksPage({super.key});

  @override
  State<SocialLinksPage> createState() => _SocialLinksPageState();
}

class _SocialLinksPageState extends State<SocialLinksPage> {
  final List<String> _socialLinks = [];
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
          Text(
            'Social links',
            style: AppTexts.title.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Column(
            children: _socialLinks.map((link) {
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
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        setState(() {
                          _socialLinks.remove(link);
                        });
                      },
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          _socialLinks.isNotEmpty
              ? const SizedBox(height: 20)
              : const SizedBox(),
          InkWell(
              onTap: () {
                AddToButtomSheetWidget.show(
                  context,
                  getTextEntyered: (text) {
                    if (_socialLinks.length < 5) {
                      setState(() {
                        _socialLinks.add(text ?? '');
                      });
                      Navigator.pop(context);
                      showToastMessage(message: "Added successfully");
                    }
                  },
                );
              },
              child: _socialLinks.length != 4
                  ? Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 24,
                          color: AppColors.iconAdd,
                        ),
                        const SizedBox(width: 8),
                        Text('Add link',
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