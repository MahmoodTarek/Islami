import 'package:islami/models/hadeth.dart';

Hadeth parseHadeth(String text) {
  final parts = text.split('\n');

  final title = parts.first.trim();
  final content = parts.skip(1).join('\n');

  return Hadeth(hadethCountArabic: title, hadethContent: content);
}
