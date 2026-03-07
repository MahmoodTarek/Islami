import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/models/zikr.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/azkar/widgets/azkar_completed_view.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/azkar/widgets/sebha.dart';
import 'package:islami/ui/islami_bottom_nav/widgets/islami_page_layout.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';

class AfterSalahAzkarTab extends StatefulWidget {
  const AfterSalahAzkarTab({super.key});

  @override
  State<AfterSalahAzkarTab> createState() => _AfterSalahAzkarTabState();
}

final List<Zikr> azkar = Zikr.azkarList();

class _AfterSalahAzkarTabState extends State<AfterSalahAzkarTab> {
  int currentZikrIndex = 0;
  int currentZikrCount = 0;
  bool isCycleCompleted = false;

  @override
  Widget build(BuildContext context) {
    return IslamiPageLayout(
      scrollable: true,
      backgroundImagePath: AppImages.bgAzkar,
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
        child: Visibility(
          visible: !isCycleCompleted,
          replacement: AzkarCompletedView(
            onNext: () {
              setState(() {
                currentZikrCount = 0;
                currentZikrIndex = 0;
                isCycleCompleted = false;
              });
            },
          ),
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                azkar[currentZikrIndex].aya,
                style: AppStyles.bold20White.copyWith(fontSize: 36.sp),
                textAlign: TextAlign.center,
              ),
              Sebha(
                currentZikr: azkar[currentZikrIndex].name,
                count: currentZikrCount,
                onTap: () {
                  plusZikr();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void plusZikr() {
    setState(() {
      if (currentZikrCount > 31) {
        if (currentZikrIndex == azkar.length - 1) isCycleCompleted = true;
        currentZikrCount = 0;
        currentZikrIndex = (currentZikrIndex + 1) % azkar.length;
      } else {
        currentZikrCount++;
      }
    });
  }
}
