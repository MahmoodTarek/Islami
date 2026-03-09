import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/ui/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/islami_bottom_nav/bottom_nav.dart';
import 'package:islami/ui/on_boarding/on_boarding_pages.dart';
import 'package:islami/ui/surah_details/surah_details.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';

class IslamiApp extends StatelessWidget {
  final bool isFirstLaunch;

  const IslamiApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        color: AppColors.darkGray,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: isFirstLaunch
            ? AppRoutes.onBoarding
            : AppRoutes.bottomNav,
        routes: {
          AppRoutes.onBoarding: (context) => OnBoardingPages(),
          AppRoutes.bottomNav: (context) => IslamiBottomNav(),
          AppRoutes.surahDetails: (context) => SurahDetails(),
          AppRoutes.hadethDetails: (context) => HadethDetails(),
        },
      ),
    );
  }
}
