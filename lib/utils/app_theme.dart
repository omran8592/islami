import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    textTheme: TextTheme(headlineLarge: AppStyles.bold16White),
  );
}
