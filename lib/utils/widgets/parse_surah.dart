String parseSurahText(String rawText, bool isAltawbah) {
  final lines = rawText.split('\n');
  String surah = '';

  int ayahNumber = 1;

  for (int i = 0; i < lines.length; i++) {
    final ayah = lines[i].trim();
    if (ayah.isEmpty) continue;

    surah += '$ayah ﴿$ayahNumber﴾ ';
    ayahNumber++;
  }

  return surah;
}
