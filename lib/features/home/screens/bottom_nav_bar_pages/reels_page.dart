import 'package:flutter/material.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 26,
                  width: 86,
                  child: Image.asset(
                    'assets/images/rigow.png',
                  )),
              const SizedBox(height: 8),
              const Text("Reels feature is coming soon!"),
            ],
          ),
        ),
      ),
    );
  }
}
