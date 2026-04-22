import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_typography.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppTheme {
  const AppTheme();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: AppTypography.textTheme,
      primaryColor: AppColors.primary,
      appBarTheme: AppBarThemeData(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: AppTypography.textTheme.titleLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: .bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTypography.textTheme.labelLarge?.copyWith(
            fontWeight: .bold,
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
    );
  }
}
