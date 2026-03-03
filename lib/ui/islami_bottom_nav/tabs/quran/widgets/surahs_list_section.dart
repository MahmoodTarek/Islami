import 'package:flutter/material.dart';
import 'package:islami/models/surah.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/surah_card.dart';
import 'package:islami/utils/app_colors.dart';

class SurahsSection extends StatelessWidget {
  const SurahsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: allSurahs.length,
      itemBuilder: (context, index) => QuranSurahCard(surah: allSurahs[index]),
      separatorBuilder: (_, _) => Divider(
        height: 20,
        thickness: 1.5,
        color: AppColors.white,
        endIndent: 64,
        indent: 64,
      ),
    );
  }
}
