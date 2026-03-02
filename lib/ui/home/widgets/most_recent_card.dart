import 'package:flutter/cupertino.dart';
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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 20, top: 12, bottom: 8),
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
                  style: AppStyles.bold24DarkGray.copyWith(fontSize: 14),
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
