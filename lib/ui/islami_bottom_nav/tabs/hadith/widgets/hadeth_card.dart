import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/ui/widgets/decorated_content.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';

class HadethCard extends StatelessWidget {
  final String hadeth;
  final String hadethTitle;

  const HadethCard({
    super.key,
    required this.hadeth,
    required this.hadethTitle,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.gold,
        image: const DecorationImage(
          image: AssetImage(AppImages.bgHadethCard),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12.h, right: 8.w, left: 8.w),
        child: DecoratedContent(
          title: hadethTitle,
          content: hadeth,
          isDetailsScreen: false,
        ),
      ),
    );
  }
}
