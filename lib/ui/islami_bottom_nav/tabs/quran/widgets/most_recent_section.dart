import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/data/most_recently_pref.dart';
import 'package:islami/data/quran_repository.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/most_recent_card.dart';

import '../../../../../utils/app_styles.dart';

class MostRecentSection extends StatefulWidget {
  const MostRecentSection({super.key});

  @override
  State<MostRecentSection> createState() => _MostRecentSectionState();
}

class _MostRecentSectionState extends State<MostRecentSection> {
  @override
  void initState() {
    super.initState();
    loadRecentSurahs();
  }

  Future<void> loadRecentSurahs() async {
    final indices = await MostRecentlyPref.getMostRecentlySurahsIndices();
    MostRecentlyPref.recentSurahsNotifier.value = indices;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<int>>(
      valueListenable: MostRecentlyPref.recentSurahsNotifier,
      builder: (context, indices, _) {
        return SizedBox(
          height: 150.h,
          child: indices.isEmpty
              ? Center(
                  child: Text(
                    'No recent surahs',
                    style: AppStyles.base16BoldCreamyYellow,
                  ),
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: indices.length,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemBuilder: (context, index) {
                    return MostRecentCard(
                      recentSurah: QuranRepository.getAllSurahs[indices[index]],
                    );
                  },
                  separatorBuilder: (_, _) => SizedBox(width: 12.w),
                ),
        );
      },
    );
  }
}
