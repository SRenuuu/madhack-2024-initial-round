import 'package:flutter/material.dart';

import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Image.asset('assets/images/workwise-logo.png'),
        ),
      ),
    );
  }
}