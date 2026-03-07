import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SurahDetailsHeader extends StatelessWidget {
  final String surahName;

  const SurahDetailsHeader({super.key, required this.surahName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.imgLeftCorner),
        Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: Text(
            surahName,
            style: AppStyles.bold24DarkGray.copyWith(color: AppColors.gold),
          ),
        ),
        Image.asset(AppImages.imgRightCorner),
      ],
    );
  }
}
