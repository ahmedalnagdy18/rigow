import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SocialLinksBottomSheetWidget extends StatefulWidget {
  const SocialLinksBottomSheetWidget({
    super.key,
    required this.getTextEntyered,
    this.isEdit = false,
    this.initialText,
    required this.bottomSheetHintText,
  });
  final void Function(String?) getTextEntyered;
  final bool isEdit;
  final String? initialText;
  final String bottomSheetHintText;

  static void show(
    BuildContext context, {
    required void Function(String?) getTextEntyered,
    bool? isEdit,
    String? initialText,
    required String bottomSheetHintText,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SocialLinksBottomSheetWidget(
          getTextEntyered: getTextEntyered,
          isEdit: isEdit ?? false,
          initialText: initialText,
          bottomSheetHintText: bottomSheetHintText,
        );
      },
    );
  }

  @override
  State<SocialLinksBottomSheetWidget> createState() =>
      _AddToButtomSheetWidgetState();
}

class _AddToButtomSheetWidgetState extends State<SocialLinksBottomSheetWidget> {
  final _nameTextController = TextEditingController();
  bool isValidLink = false;

  @override
  void initState() {
    if (widget.isEdit && widget.initialText != null) {
      _nameTextController.text = widget.initialText!;
      _validateLink(_nameTextController.text);
    }
    _nameTextController.addListener(() {
      _validateLink(_nameTextController.text);
    });
    super.initState();
  }

  void _validateLink(String text) {
    final RegExp linkRegex = RegExp(
      r'^(https?:\/\/)(www\.)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}([\/\w .-]*)*\/?(\?.*)?$',
    );
    setState(() {
      isValidLink = linkRegex.hasMatch(text);
    });
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                height: appHight(context, 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        inputFormatters: [
                          noSpaceFormatter(),
                        ],
                        controller: _nameTextController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintText,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: widget.bottomSheetHintText,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: TranceparentButtonWidget(
                              borderColor: Colors.red,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: AppLocalizations.of(context)!.cancel,
                              textColor: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ColoredButtonWidget(
                              text: AppLocalizations.of(context)!.next,
                              onPressed: () {
                                isValidLink
                                    ? widget.getTextEntyered(
                                        _nameTextController.text)
                                    : showErrorToastMessage(
                                        message: "you sholud put link");
                              },
                              grideantColors: AppColors.mainRed,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isValidLink && _nameTextController.text.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Please enter a valid link.',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
