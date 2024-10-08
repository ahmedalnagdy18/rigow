import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/l10n/app_localizations.dart';

class AddToButtomSheetWidget extends StatefulWidget {
  const AddToButtomSheetWidget({
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
        return AddToButtomSheetWidget(
          getTextEntyered: getTextEntyered,
          isEdit: isEdit ?? false,
          initialText: initialText,
          bottomSheetHintText: bottomSheetHintText,
        );
      },
    );
  }

  @override
  State<AddToButtomSheetWidget> createState() => _AddToButtomSheetWidgetState();
}

class _AddToButtomSheetWidgetState extends State<AddToButtomSheetWidget> {
  final _nameTextController = TextEditingController();
  @override
  void initState() {
    if (widget.isEdit && widget.initialText != null) {
      _nameTextController.text = widget.initialText!;
    }
    super.initState();
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
                                _nameTextController.text.isEmpty
                                    ? showErrorToastMessage(
                                        message:
                                            "Please fill the field to proceed.")
                                    : widget.getTextEntyered(
                                        _nameTextController.text);
                              },
                              grideantColors: AppColors.mainRed,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
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
