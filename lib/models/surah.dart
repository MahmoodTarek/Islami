import 'package:flutter/cupertino.dart';

@immutable
class Surah {
  final int number;
  final String arabicName;
  final String englishName;
  final int ayahCount;

  const Surah({
    required this.number,
    required this.arabicName,
    required this.englishName,
    required this.ayahCount,
  });
}

