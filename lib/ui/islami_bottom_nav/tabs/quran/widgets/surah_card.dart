import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/models/surah.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class QuranSurahCard extends StatelessWidget {
  final Surah surah;

  const QuranSurahCard({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    final double icSurahNumberSize = surah.number > 99 ? 54 : 52;
    final double surahNumberSize = surah.number > 99 ? 16 : 20;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/surah-details', arguments: surah);
      },
      child: Row(
        spacing: 24,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.icSurahNumber,
                width: icSurahNumberSize.w,
                height: icSurahNumberSize.h,
              ),
              Text(
                "${surah.number}",
                style: AppStyles.bold20White.copyWith(
                    fontSize: surahNumberSize.sp),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(surah.englishName, style: AppStyles.bold20White),
              Text(
                '${surah.ayahCount} Verses',
                style: AppStyles.bold20White.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          Spacer(),
          Text(surah.arabicName, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}
