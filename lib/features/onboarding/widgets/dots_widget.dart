import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget(
      {super.key, required this.dotsCount, required this.position});
  final int dotsCount;
  final int position;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        size: const Size.square(10),
        activeSize: const Size(24, 9),
        activeShape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5.0),
        ),
        activeColor: Colors.white,
        color: Colors.transparent,
        spacing: const EdgeInsets.all(3),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
