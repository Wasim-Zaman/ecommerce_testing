import 'package:ecommerce_testing/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryLight,
      brightness: Brightness.light,
    ),
    // Custom colors
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 20,
        fontWeight: FontWeight.w600, // SF Pro Display weight
        fontFamily: '.SF Pro Display', // iOS system font
      ),
    ),

    // Card theme
    cardTheme: CardTheme(
      elevation: 0, // iOS cards typically have no elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!), // iOS-style border
      ),
      color: AppColors.cardLight,
    ),

    // Text theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 34, // iOS large title size
        fontWeight: FontWeight.w700,
        fontFamily: '.SF Pro Display',
        color: AppColors.textPrimaryLight,
        letterSpacing: 0.37,
      ),
      headlineMedium: TextStyle(
        fontSize: 28, // iOS title 1 size
        fontWeight: FontWeight.w600,
        fontFamily: '.SF Pro Display',
        color: AppColors.textPrimaryLight,
        letterSpacing: 0.36,
      ),
      bodyLarge: TextStyle(
        fontSize: 17, // iOS body size
        fontWeight: FontWeight.w400,
        fontFamily: '.SF Pro Text',
        color: AppColors.textSecondaryLight,
        letterSpacing: -0.41,
      ),
      bodyMedium: TextStyle(
        fontSize: 15, // iOS callout size
        fontWeight: FontWeight.w400,
        fontFamily: '.SF Pro Text',
        color: AppColors.textSecondaryLight,
        letterSpacing: -0.24,
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    ),

    // Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle: const TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Cupertino override theme
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppColors.primaryLight,
      textTheme: CupertinoTextThemeData(
        primaryColor: AppColors.primaryLight,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      brightness: Brightness.dark,
    ),
    // Custom colors
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Card theme
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.cardDark,
    ),

    // Text theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryDark,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textSecondaryDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textSecondaryDark,
      ),
    ),
  );
}
