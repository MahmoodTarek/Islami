import 'package:flutter/cupertino.dart';
import 'package:islami/utils/app_shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentlyPref {
  static ValueNotifier<List<int>> recentSurahsNotifier = ValueNotifier([]);

  static Future<void> saveMostRecentlySurah(int newSurahIndex) async {
    final preference = await SharedPreferences.getInstance();

    List<String> mostRecentlySurahsIndices =
        preference.getStringList(AppSharedPrefKey.mostRecentlySurahs) ?? [];

    mostRecentlySurahsIndices.remove(newSurahIndex.toString());

    mostRecentlySurahsIndices.insert(0, newSurahIndex.toString());

    if (mostRecentlySurahsIndices.length > 5) {
      mostRecentlySurahsIndices = mostRecentlySurahsIndices.sublist(0, 5);
    }

    await preference.setStringList(
      AppSharedPrefKey.mostRecentlySurahs,
      mostRecentlySurahsIndices,
    );

    recentSurahsNotifier.value = mostRecentlySurahsIndices
        .map(int.parse)
        .toList();
  }

  static Future<List<int>> getMostRecentlySurahsIndices() async {
    final preference = await SharedPreferences.getInstance();

    return (preference.getStringList(AppSharedPrefKey.mostRecentlySurahs) ?? [])
        .map(int.parse)
        .toList();
  }
}
