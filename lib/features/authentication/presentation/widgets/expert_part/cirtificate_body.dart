import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/select_file_sheet_widget.dart';

class CirtificateContainerWidget extends StatefulWidget {
  final String title;
  final String iconImage;
  final double? size;
  final void Function(File? selectedImage) onSelectedImageBack;
  final void Function(File? takeImage) onSelectedTakeImage;
  final bool isPdf;

  const CirtificateContainerWidget(
      {super.key,
      required this.title,
      required this.iconImage,
      this.size,
      required this.onSelectedImageBack,
      required this.isPdf,
      required this.onSelectedTakeImage});

  @override
  State<CirtificateContainerWidget> createState() =>
      _CirtificateContainerWidgetState();
}

class _CirtificateContainerWidgetState
    extends State<CirtificateContainerWidget> {
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final selectedImage = File(image.path);
    _selectedImage = selectedImage;
    widget.onSelectedImageBack(_selectedImage);
    setState(() {});
  }

  Future takeImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final takeImage = File(image.path);
    _takeImage = takeImage;
    widget.onSelectedTakeImage(_takeImage);
    setState(() {});
  }

  File? _selectedImage;
  File? _takeImage;

  _CirtificateContainerWidgetState();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widget.size ?? 0),
            bottomRight: Radius.circular(widget.size ?? 0)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (_selectedImage != null)
                  ? const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.check_circle,
                          color: Colors.green, size: 18),
                    )
                  : const SizedBox(),
              Text(
                widget.title,
                style: AppTexts.regular,
              ),
            ],
          ),
          const SizedBox(height: 18),
          (_selectedImage == null)
              ? GestureDetector(
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SelectFileSheetWidget(
                        cameraTap: () {
                          takeImage();
                          Navigator.pop(context);
                        },
                        pdfTap: () {
                          pickImage();
                          Navigator.pop(context);
                        },
                        onTap: () {
                          pickImage();
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: DashedBorder.all(
                        dashLength: 4,
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(widget.iconImage),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Tap to upload',
                          style: AppTexts.miniRegular.copyWith(
                            color: AppColors.textfieldBorder,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          size: 24,
                          Icons.file_upload_outlined,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                )
              : widget.isPdf
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.grey,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 32,
                              height: 38,
                              child: Image.asset(
                                "assets/images/pdfIcon.png",
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Government permit',
                                style: AppTexts.medium.copyWith(
                                  color: AppColors.clickedTextfieldBorder,
                                ),
                              ),
                              Text(
                                '16 Mb',
                                style: AppTexts.small.copyWith(
                                  color: AppColors.clickedTextfieldBorder,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                setState(() {
                                  _selectedImage = null;
                                  widget.onSelectedImageBack(null);
                                });
                              },
                              color: Colors.red),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 151,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedImage = null;
                                    widget.onSelectedImageBack(null);
                                  });
                                },
                              )
                            ],
                          );
                        },
                      ),
                    )
        ],
      ),
    );
  }
}