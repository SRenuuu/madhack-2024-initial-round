import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAndToNamed('/root');
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
          child: Image.asset('assets/images/workwise-logo.png'),
        ),
      ),
    );
  }
}
