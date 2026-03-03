import 'package:flutter/material.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/most_recent_section.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/surah_search_field.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/quran/widgets/surahs_list_section.dart';
import 'package:islami/ui/islami_bottom_nav/widgets/custom_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_strings.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/widgets/islami_header.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return IslamiPageLayout(
      backgroundImage: AppImages.bgQuran,
      setIslamiHeader: false,
      scrollable: false,
      content: CustomScrollView(
        slivers: [
          paddedSliver(
            padding: defaultPadding.copyWith(right: 48, left: 48),
            child: const IslamiHeader(),
          ),

          paddedSliver(
            padding: defaultPadding.copyWith(bottom: 10),
            child: const SurahSearchField(),
          ),

          titleSliver(AppStrings.homeMostRecentlyTitle),

          SliverToBoxAdapter(child: MostRecentSection()),

          titleSliver(AppStrings.homeSurahsListTitle),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            sliver: const SurahsSection(),
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
      padding: defaultPadding.copyWith(bottom: 10, top: 10),
      child: Text(title, style: AppStyles.base16BoldCreamyYellow),
    );
  }
}
