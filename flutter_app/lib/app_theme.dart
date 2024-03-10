import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData getTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.accentColor,
      scaffoldBackgroundColor: Colors.white,
      splashColor: AppColors.accentColor,
      highlightColor: AppColors.accentColor,
      cardColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: AppColors.primaryColor,
        cursorColor: AppColors.primaryColor,
        selectionColor: AppColors.accentColor,
      ),
      // textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      inputDecorationTheme: _buildInputDecorationTheme(
        base.inputDecorationTheme,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          textStyle: const TextStyle(fontSize: 17.0),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          textStyle: const TextStyle(fontSize: 17.0),
          foregroundColor: AppColors.primaryColor,
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: Colors.grey,
        overlayColor:
            MaterialStateProperty.all(AppColors.primaryColor.withOpacity(0.1)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: AppColors.primaryColor.withOpacity(0.05),
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(color: AppColors.primaryColor),
      headlineLarge:
          base.headlineLarge?.copyWith(color: AppColors.primaryColor),
      titleLarge: base.titleLarge?.copyWith(color: AppColors.primaryColor),
      bodyLarge: base.bodyLarge?.copyWith(color: AppColors.primaryColor),
      labelLarge: base.labelLarge?.copyWith(color: AppColors.primaryColor),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(
      InputDecorationTheme base) {
    return base.copyWith(
      floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 2.0,
          color: AppColors.primaryColor,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 2.0,
          color: AppColors.greyColor,
        ),
      ),
    );
  }
}
