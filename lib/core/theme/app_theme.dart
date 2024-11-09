import 'package:ecommerce_testing/core/constants/app_colors.dart';
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
        fontWeight: FontWeight.bold,
      ),
    ),

    // Card theme
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.cardLight,
    ),

    // Text theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryLight,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryLight,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textSecondaryLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textSecondaryLight,
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
