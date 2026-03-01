import 'package:flutter/material.dart';
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
    bodyPadding: EdgeInsets.symmetric(horizontal: 16),
    footerPadding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
  );

  late final List<PageViewModel> pages = createPages();

  List<PageViewModel> createPages() => [
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppAssets.onBoardingWelcome,
        title: AppStrings.onBoardingWelcomeDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppAssets.onBoardingMosque,
        title: AppStrings.onBoardingMosqueTitle,
        description: AppStrings.onBoardingMosqueDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppAssets.onBoardingQuran,
        title: AppStrings.onBoardingQuranTitle,
        description: AppStrings.onBoardingQuranDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppAssets.onBoardingBearish,
        title: AppStrings.onBoardingBearishTitle,
        description: AppStrings.onBoardingBearishDesc,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: OnBoardingPage(
        image: AppAssets.onBoardingRadio,
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
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.softYellow,
        color: AppColors.darkGray,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      next: const Text(AppStrings.onBoardingNext, style: AppStyles.base),
      done: const Text(AppStrings.onBoardingDone, style: AppStyles.base),
      back: const Text(AppStrings.onBoardingBack, style: AppStyles.base),
      onDone: () {
        AppLaunchService.setFirstLaunch();
        /*TODO: fix white flash*/
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      },
      baseBtnStyle: TextButton.styleFrom(backgroundColor: Colors.transparent),
    );
  }
}
