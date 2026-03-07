import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/widgets/islami_header.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String? description;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 40.h,
        children: [
          IslamiHeader(),
          Image.asset(image),
          Visibility(
            visible: description == null,
            child: SizedBox(height: 40.h),
          ),
          Text(
            title,
            style: AppStyles.bold24DarkGray.copyWith(color: AppColors.gold),
          ),

          Visibility(
            visible: description != null,
            child: Text(
              description ?? '',
              textAlign: TextAlign.center,
              style: AppStyles.base16BoldGold.copyWith(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
