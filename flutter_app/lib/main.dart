import 'package:flutter/material.dart';
import 'package:flutter_app/views/splash_view.dart';

import 'theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkWise - Job Search',
      theme: AppTheme.getTheme(),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
