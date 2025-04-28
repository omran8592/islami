import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blakeBgColor,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: AppColors.primaryColor
          )
      )
  );
}
