import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 111,
          height: 33,
          child: Image.asset(
            'assets/images/rigow.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
