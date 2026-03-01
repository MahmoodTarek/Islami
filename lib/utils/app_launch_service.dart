import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static const String firstLaunchKey = 'is_first_launch';

  static Future<bool> isFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    final isFirst = preference.getBool(firstLaunchKey);

    if (isFirst == null) {
      await preference.setBool(firstLaunchKey, false);
      return true;
    }
    return false;
  }
}
