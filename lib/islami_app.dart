import 'package:flutter/material.dart';
import 'package:islami/ui/home/home.dart';
import 'package:islami/ui/on_boarding/on_boarding_pages.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_launch_service.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

class IslamiApp extends StatelessWidget {
  final bool isFirstLaunch;

  IslamiApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.darkGray,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: isFirstLaunch ? AppRoutes.onBoarding : AppRoutes.home,
      routes: {
        AppRoutes.onBoarding: (context) => OnBoardingPages(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
