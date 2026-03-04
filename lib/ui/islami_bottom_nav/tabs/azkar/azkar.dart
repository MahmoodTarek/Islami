import 'package:flutter/material.dart';
import 'package:islami/models/zikr.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/azkar/widgets/sebha.dart';
import 'package:islami/ui/islami_bottom_nav/widgets/islami_page_layout.dart';
import 'package:islami/utils/app_strings.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';

class AzkarTab extends StatefulWidget {
  const AzkarTab({super.key});

  @override
  State<AzkarTab> createState() => _AzkarTabState();
}

class _AzkarTabState extends State<AzkarTab> {
  List<Zikr> azkarList = [
    Zikr(
      name: AppStrings.tabAzkarSubhanAllah,
      aya: AppStrings.tabAzkarSubhanAllahAya,
    ),
    Zikr(
      name: AppStrings.tabAzkarAlhamdulillah,
      aya: AppStrings.tabAzkarAlhamdulillahAya,
    ),
    Zikr(
      name: AppStrings.tabAzkarAllahAkbar,
      aya: AppStrings.tabAzkarAllahAkbarAya,
    ),
  ];
  int currentZikrIndex = 0;
  int currentCount = 0;

  @override
  Widget build(BuildContext context) {
    return IslamiPageLayout(
      scrollable: true,
      backgroundImagePath: AppImages.bgAzkar,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 24),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              azkarList[currentZikrIndex].aya,
              style: AppStyles.bold20White.copyWith(fontSize: 36),
              textAlign: TextAlign.center,
            ),
            Sebha(
              currentZikr: azkarList[currentZikrIndex].name,
              count: currentCount,
              onTap: () {
                addOnZikr();
              },
            ),
          ],
        ),
      ),
    );
  }

  void addOnZikr() {
    setState(() {
      if (currentCount == 33) {
        currentCount = 0;
        currentZikrIndex = (currentZikrIndex + 1) % azkarList.length;
      } else {
        currentCount++;
      }
    });
  }
}
