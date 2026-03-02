import 'package:flutter/material.dart';
import 'package:islami/ui/home/widgets/islami_search_field.dart';
import 'package:islami/ui/home/widgets/most_recent_section.dart';
import 'package:islami/ui/home/widgets/surahs_list_section.dart';
import 'package:islami/utils/widgets/islami_scaffold.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../../utils/widgets/islami_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(
    horizontal: 20,
  );

  @override
  Widget build(BuildContext context) {
    return IslamiScaffold(
      backgroundImage: AppImages.bgHome,
      content: CustomScrollView(
        slivers: [
          paddedSliver(
            padding: defaultPadding.copyWith(right: 48,left: 48),
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
