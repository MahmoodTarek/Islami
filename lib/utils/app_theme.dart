import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

abstract class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkGray,
    canvasColor: AppColors.darkGray,
    fontFamily: 'Janna',
  );
}
