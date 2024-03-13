import 'package:flutter/material.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:flutter_app/services/resume_upload_service.dart';
import 'package:flutter_app/views/auth/login_view.dart';
import 'package:flutter_app/views/home_view.dart';
import 'package:flutter_app/views/resume_upload_view.dart';
import 'package:flutter_app/views/root_view.dart';
import 'package:flutter_app/views/splash_view.dart';
import 'package:get/get.dart';

import 'theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<GetConnect>(GetConnect());
    Get.put(AuthService());
    Get.put(ApiService());
    Get.put(ResumeUploadService());

    return GetMaterialApp(
        title: 'WorkWise - Job Search',
        theme: AppTheme.getTheme(),
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/root': (context) => const RootView(),
          '/login': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
          '/resume': (context) => const ResumeUploadView(),
        });
  }
}
