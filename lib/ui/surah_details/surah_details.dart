import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/models/surah.dart';
import 'package:islami/ui/surah_details/widgets/SurahdetailsHeader.dart';
import 'package:islami/ui/surah_details/widgets/surah_details_app_bar.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SurahDetails extends StatefulWidget {
  const SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  String surahText = '';
  bool _loaded = false;
  late Surah surah;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loaded) {
      surah = ModalRoute.of(context)!.settings.arguments as Surah;
      loadSurah(surah.number);
      _loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SurahDetailsAppBar(surahName: surah.englishName),
      body: SafeArea(
        child: Column(
          spacing: 4.h,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                children: [
                  SurahDetailsHeader(surahName: surah.arabicName),
                  Text(
                    surahText,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppStyles.bold20White.copyWith(
                      color: AppColors.gold,
                      height: 2.4.h,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(AppImages.imgSurahBottom, width: double.infinity),
          ],
        ),
      ),
    );
  }

  Future<void> loadSurah(int surahNumber) async {
    final surahFile = await rootBundle.loadString(
      'assets/files/quran/$surahNumber.txt',
    );

    setState(() {
      surahText = formatSurahText(surahFile);
    });
  }

  String formatSurahText(String surahText) {
    final verses = surahText
        .split('\n')
        .where((v) => v.trim().isNotEmpty)
        .toList();
    String surahBuffer = '';

    for (int i = 0; i < verses.length; i++) {
      surahBuffer += verses[i];
      surahBuffer += '﴿${i + 1}﴾ ';
    }

    return surahBuffer.toString();
  }
}
