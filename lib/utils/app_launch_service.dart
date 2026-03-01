import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static const String firstLaunchKey = 'is_first_launch';

  static Future<bool> isFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(firstLaunchKey) ?? true;
  }

  static Future<void> setFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool(firstLaunchKey, false);
  }
}
