import 'package:flutter/material.dart';
import 'package:islami/data/quran_repository.dart';
import 'package:islami/models/surah.dart';
import 'package:islami/ui/widgets/decorated_content.dart';
import 'package:islami/ui/widgets/islami_app_bar.dart';

class SurahDetails extends StatefulWidget {
  const SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  String surahText = '';
  bool _loaded = false;
  late Surah surah;
  bool isLoading = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      surah = ModalRoute.of(context)!.settings.arguments as Surah;
      loadSurahText();
    }
  }

  Future<void> loadSurahText() async {
    try {
      final text = await QuranRepository.loadSurah(surah.number);
      setState(() {
        surahText = text;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IslamiAppBar(title: surah.englishName),
      body: DecoratedContent(
        title: surah.arabicName,
        content: surahText,
        isDetailsScreen: true,
      ),
    );
  }
}
