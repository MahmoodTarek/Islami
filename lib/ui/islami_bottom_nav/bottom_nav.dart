import 'package:flutter/material.dart';
import 'package:islami/ui/bottom_nav/tabs/azkar/azkar.dart';
import 'package:islami/ui/bottom_nav/tabs/hadith/hadith.dart';
import 'package:islami/ui/bottom_nav/tabs/quran/quran_tab.dart';
import 'package:islami/ui/bottom_nav/tabs/radio/radio.dart';
import 'package:islami/ui/bottom_nav/tabs/time/time.dart';
import 'package:islami/ui/bottom_nav/widgets/tab_icon.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_strings.dart';
import 'package:islami/utils/app_styles.dart';

class IslamiBottomNav extends StatefulWidget {
  const IslamiBottomNav({super.key});

  @override
  State<IslamiBottomNav> createState() => _IslamiBottomNavState();
}

class _IslamiBottomNavState extends State<IslamiBottomNav> {
  int selectedIndex = 0;

  final tabs = [QuranTab(), HadithTab(), AzkarTab(), RadioTab(), TimeTab()];

  final Color tabBackground = AppColors.darkGray.withValues(alpha: .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        elevation: 0,
        iconSize: 22,
        selectedFontSize: 12,
        backgroundColor: AppColors.gold,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.darkGray,
        selectedLabelStyle: AppStyles.bold20White.copyWith(fontSize: 12),
        items: bottomNavItems,
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(
    icon: TabIcon(path: AppIcons.icTabQuran),
    label: AppStrings.tabQuranTitle,
    backgroundColor: AppColors.gold,
    activeIcon: TabIcon(path: AppIcons.icTabQuran, isSelected: true),
  ),
  BottomNavigationBarItem(
    icon: TabIcon(path: AppIcons.icTabHadith),
    label: AppStrings.tabHadithTitle,
    backgroundColor: AppColors.gold,
    activeIcon: TabIcon(path: AppIcons.icTabHadith, isSelected: true),
  ),
  BottomNavigationBarItem(
    icon: TabIcon(path: AppIcons.icTabAzkar),
    label: AppStrings.tabAzkarTitle,
    backgroundColor: AppColors.gold,
    activeIcon: TabIcon(path: AppIcons.icTabAzkar, isSelected: true),
  ),
  BottomNavigationBarItem(
    icon: TabIcon(path: AppIcons.icTabRadio),
    label: AppStrings.tabRadioTitle,
    backgroundColor: AppColors.gold,
    activeIcon: TabIcon(path: AppIcons.icTabRadio, isSelected: true),
  ),
  BottomNavigationBarItem(
    icon: TabIcon(path: AppIcons.icTabTime),
    label: AppStrings.tabTimeTitle,
    backgroundColor: AppColors.gold,
    activeIcon: TabIcon(path: AppIcons.icTabTime, isSelected: true),
  ),
];
