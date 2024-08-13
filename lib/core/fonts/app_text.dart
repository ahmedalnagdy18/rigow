import 'package:flutter/material.dart';

class TextAppTheme {
  static const TextStyle title = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 20,
  );

  static const TextStyle subTitle = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  static const TextStyle regular = TextStyle(
    fontSize: 16,
  );

  static const TextStyle miniRegular = TextStyle(
    fontSize: 14,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
  );
}

class RedText extends StatelessWidget {
  const RedText({
    super.key,
    required this.text,
    required this.gradient,
  });

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
