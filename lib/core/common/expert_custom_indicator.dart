import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';

class ExpertCustomIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const ExpertCustomIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalPages, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: currentPage >= index
                    ? AppColors.mainRed
                    : AppColors.greyLoader,
              ),
            ),
          ),
        );
      }),
    );
  }
}
