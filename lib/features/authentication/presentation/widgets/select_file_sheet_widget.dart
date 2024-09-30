import 'package:flutter/material.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';

class SelectFileSheetWidget extends StatelessWidget {
  const SelectFileSheetWidget(
      {super.key,
      required this.onTap,
      required this.pdfTap,
      required this.cameraTap,
      required this.isProfile});
  final Function()? onTap;
  final Function()? pdfTap;
  final Function()? cameraTap;
  final bool isProfile;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      height: appHight(context, 0.28),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upload',
                  style: AppTexts.regularSimiBold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 16),
            InkWell(
              onTap: onTap,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.photo),
                  SizedBox(width: 14),
                  Text('Gallery')
                ],
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: cameraTap,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.camera_alt_outlined),
                  SizedBox(width: 14),
                  Text('Camera')
                ],
              ),
            ),
            SizedBox(height: isProfile ? 0 : 25),
            isProfile
                ? const SizedBox()
                : InkWell(
                    onTap: pdfTap,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.picture_as_pdf_outlined),
                        SizedBox(width: 14),
                        Text('Pdf')
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
