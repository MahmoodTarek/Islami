import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/data/quran_repository.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/surah_card.dart';
import 'package:islami/utils/app_colors.dart';

class SurahsSection extends StatelessWidget {
  const SurahsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final allSurahs = QuranRepository.getAllSurahs;

    return SliverList.separated(
      itemCount: allSurahs.length,
      itemBuilder: (context, index) => QuranSurahCard(surah: allSurahs[index]),
      separatorBuilder: (_, _) => Divider(
        height: 20.h,
        thickness: 1.5,
        color: AppColors.white,
        endIndent: 64.w,
        indent: 64.w,
      ),
    );
  }
}
