import 'package:flutter/services.dart';
import 'package:islami/models/hadeth.dart';
import 'package:islami/utils/parse_hadeth.dart';

class HadethRepository {
  Future<List<Hadeth>> loadAhadeth() async {
    final futures = List.generate(
      50,
      (fileNumber) =>
          rootBundle.loadString('assets/files/hadeeth/h${fileNumber + 1}.txt'),
    );

    final hadethFiles = await Future.wait(futures);
    return hadethFiles.map(parseHadeth).toList();
  }
}
