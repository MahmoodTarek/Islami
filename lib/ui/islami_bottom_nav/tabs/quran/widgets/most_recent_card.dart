import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/models/recent_surah.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class MostRecentCard extends StatelessWidget {
  final RecentSurah recentSurah;

  const MostRecentCard({super.key, required this.recentSurah});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            right: 8.w, left: 20.w, top: 12.h, bottom: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recentSurah.englishName, style: AppStyles.bold24DarkGray),
                Text(recentSurah.arabicName, style: AppStyles.bold24DarkGray),
                Text(
                  '${recentSurah.versesCount} Verses',
                  style: AppStyles.bold24DarkGray.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
            Image.asset(AppImages.imgMostRecent),
          ],
        ),
      ),
    );
  }
}
