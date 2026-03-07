import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/ui/on_boarding/on_boarding_page.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_launch_service.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_strings.dart';

import '../../utils/app_styles.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({super.key});

  @override
  State<OnBoardingPages> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPages> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final pageDecoration = PageDecoration(
    titlePadding: EdgeInsets.zero,
    pageColor: Colors.transparent,
    pageMargin: EdgeInsets.zero,
    bodyPadding: EdgeInsets.symmetric(horizontal: 16.w),
    footerPadding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
  );

  late final List<PageViewModel> pages = createPages();

  List<PageViewModel> createPages() => [
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppImages.onBoardingWelcome,
        title: AppStrings.onBoardingWelcomeDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppImages.onBoardingMosque,
        title: AppStrings.onBoardingMosqueTitle,
        description: AppStrings.onBoardingMosqueDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppImages.onBoardingQuran,
        title: AppStrings.onBoardingQuranTitle,
        description: AppStrings.onBoardingQuranDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppImages.onBoardingBearish,
        title: AppStrings.onBoardingBearishTitle,
        description: AppStrings.onBoardingBearishDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppImages.onBoardingRadio,
        title: AppStrings.onBoardingRadioTitle,
        description: AppStrings.onBoardingRadioDesc,
      ),
      decoration: pageDecoration,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      controlsPadding: EdgeInsets.zero,
      resizeToAvoidBottomInset: true,
      showNextButton: true,
      showBackButton: true,
      showDoneButton: true,
      dotsContainerDecorator: BoxDecoration(),
      animationDuration: 400,
      pages: pages,
      dotsDecorator: DotsDecorator(
        size: Size.square(10.0.r),
        activeSize: Size(20.0.w, 10.0.h),
        activeColor: AppColors.softYellow,
        color: AppColors.darkGray,
        spacing: EdgeInsets.symmetric(horizontal: 3.0.w),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0.r),
        ),
      ),
      nextFlex: 1,
      nextStyle: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      doneStyle: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      backStyle: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      next: Text(AppStrings.onBoardingNext, style: AppStyles.base16BoldGold),
      done: Text(AppStrings.onBoardingDone, style: AppStyles.base16BoldGold),
      back: Text(AppStrings.onBoardingBack, style: AppStyles.base16BoldGold),
      onDone: () {
        AppLaunchService.setFirstLaunch();
        /*TODO: fix white flash*/
        Navigator.of(context).pushReplacementNamed(AppRoutes.bottomNav);
      },
      baseBtnStyle: TextButton.styleFrom(backgroundColor: Colors.transparent),
    );
  }
}
