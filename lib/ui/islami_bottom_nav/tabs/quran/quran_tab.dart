import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/models/surah.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/most_recent_section.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/surah_search_field.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/surahs_list_section.dart';
import 'package:islami/ui/islami_bottom_nav/widgets/islami_page_layout.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_strings.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/widgets/islami_header.dart';

import '../../../../data/quran_repository.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(horizontal: 20);

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String surahSearch = '';
  late final List<Surah> quranSurahs;

  @override
  void initState() {
    super.initState();
    quranSurahs = QuranRepository.getAllSurahs;
  }

  List<Surah> get filteredSurahs {
    final search = surahSearch.trim().toLowerCase();

    if (search.isEmpty) return quranSurahs;

    return quranSurahs.where((surah) {
      return surah.arabicName.contains(surahSearch) ||
          surah.englishName.toLowerCase().contains(search);
    }).toList();
  }

  void onSearchSurahChanged(String value) {
    setState(() {
      surahSearch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IslamiPageLayout(
      backgroundImagePath: AppImages.bgQuran,
      setIslamiHeader: false,
      scrollable: false,
      content: CustomScrollView(
        slivers: [
          paddedSliver(
            padding: QuranTab.defaultPadding.copyWith(right: 48.w, left: 48.w),
            child: const IslamiHeader(),
          ),
          paddedSliver(
            padding: QuranTab.defaultPadding.copyWith(bottom: 10.h),
            child: SurahSearchField(onChangeSurahSearch: onSearchSurahChanged),
          ),
          if (surahSearch.isEmpty) ...[
            titleSliver(AppStrings.homeMostRecentlyTitle),
            const SliverToBoxAdapter(child: MostRecentSection()),
          ],
          titleSliver(AppStrings.homeSurahsListTitle),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 10.h),
            sliver: SurahsSection(quranSurahs: filteredSurahs),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter paddedSliver({
    required EdgeInsets padding,
    required Widget child,
  }) {
    return SliverToBoxAdapter(
      child: Padding(padding: padding, child: child),
    );
  }

  SliverToBoxAdapter titleSliver(String title) {
    return paddedSliver(
      padding: QuranTab.defaultPadding.copyWith(bottom: 10.h, top: 10.h),
      child: Text(title, style: AppStyles.base16BoldCreamyYellow),
    );
  }
}
