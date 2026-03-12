import 'package:islami/utils/app_shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static Future<bool> isFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(AppSharedPrefKey.firstLaunch) ?? true;
  }

  static Future<void> setFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool(AppSharedPrefKey.firstLaunch, false);
  }
}
