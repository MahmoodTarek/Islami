import 'package:flutter/material.dart';
import 'package:islami/models/recent_surah.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/most_recent_card.dart';

class MostRecentSection extends StatelessWidget {
  const MostRecentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recentSurahs.length,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) =>
            MostRecentCard(recentSurah: recentSurahs[index]),
        separatorBuilder: (_, _) => SizedBox(width: 12),
      ),
    );
  }
}

List<RecentSurah> recentSurahs = [
  const RecentSurah(
    englishName: 'Al-Fatiha',
    arabicName: 'الفاتحة',
    versesCount: 7,
  ),

  const RecentSurah(
    englishName: 'Al-Baqarah',
    arabicName: 'البقرة',
    versesCount: 286,
  ),

  const RecentSurah(
    englishName: 'Al-Kahf',
    arabicName: 'الكهف',
    versesCount: 110,
  ),

  const RecentSurah(englishName: 'Yasin', arabicName: 'يس', versesCount: 83),

  const RecentSurah(
    englishName: 'Ar-Rahman',
    arabicName: 'الرحمن',
    versesCount: 78,
  ),

  const RecentSurah(
    englishName: 'Al-Mulk',
    arabicName: 'الملك',
    versesCount: 30,
  ),

  const RecentSurah(englishName: 'An-Nas', arabicName: 'الناس', versesCount: 6),
];
