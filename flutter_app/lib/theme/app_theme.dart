import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData getTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: WorkWiseColor.primaryColor,
      hintColor: WorkWiseColor.accentColor,
      scaffoldBackgroundColor: Colors.white,
      splashColor: WorkWiseColor.accentColor,
      highlightColor: WorkWiseColor.accentColor,
      cardColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: WorkWiseColor.primaryColor,
        cursorColor: WorkWiseColor.primaryColor,
        selectionColor: WorkWiseColor.accentColor,
      ),
      // textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      inputDecorationTheme: _buildInputDecorationTheme(
        base.inputDecorationTheme,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: WorkWiseColor.primaryColor,
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
          backgroundColor: WorkWiseColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          textStyle: const TextStyle(fontSize: 17.0),
          foregroundColor: WorkWiseColor.primaryColor,
          side: const BorderSide(
            color: WorkWiseColor.primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: WorkWiseColor.primaryColor,
        labelColor: WorkWiseColor.primaryColor,
        unselectedLabelColor: Colors.grey,
        overlayColor: MaterialStateProperty.all(
            WorkWiseColor.primaryColor.withOpacity(0.1)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: WorkWiseColor.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: WorkWiseColor.primaryColor.withOpacity(0.05),
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge:
          base.displayLarge?.copyWith(color: WorkWiseColor.primaryColor),
      headlineLarge:
          base.headlineLarge?.copyWith(color: WorkWiseColor.primaryColor),
      titleLarge: base.titleLarge?.copyWith(color: WorkWiseColor.primaryColor),
      bodyLarge: base.bodyLarge?.copyWith(color: WorkWiseColor.primaryColor),
      labelLarge: base.labelLarge?.copyWith(color: WorkWiseColor.primaryColor),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(
      InputDecorationTheme base) {
    return base.copyWith(
      floatingLabelStyle: const TextStyle(color: WorkWiseColor.primaryColor),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 2.0,
          color: WorkWiseColor.primaryColor,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 2.0,
          color: WorkWiseColor.greyColor,
        ),
      ),
    );
  }
}
