import '../utils/app_strings.dart';

class Zikr {
  final String name;
  final String aya;

  const Zikr({required this.name, required this.aya});

  static List<Zikr> azkarList() => const [
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
}
