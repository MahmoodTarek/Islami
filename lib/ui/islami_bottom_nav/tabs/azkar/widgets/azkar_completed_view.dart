import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_strings.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/app_colors.dart';

class AzkarCompletedView extends StatelessWidget {
  final VoidCallback onNext;

  const AzkarCompletedView({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Lottie.asset(AppImages.imgCompletedSuccessfully),
        ),
        Text(
          AppStrings.azkarCompletedViewDesc,
          style: AppStyles.bold20White.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        Text(
          AppStrings.azkarCompletedViewTitle,
          style: AppStyles.bold20White.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkGray,
              elevation: 0,
            ),
            child: Text(
              AppStrings.nextSalahAzkar,
              style: AppStyles.bold20White.copyWith(color: AppColors.darkGray),
            ),
          ),
        ),
      ],
    );
  }
}
