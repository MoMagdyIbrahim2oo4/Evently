import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String onboardingSeen = 'AfterOnboarding';

  static Future<void> setKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = prefs.getBool(onboardingSeen) ?? false;
    flag = true;
    prefs.setBool(onboardingSeen, flag);
  }

  static Future<bool> getKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = prefs.getBool(onboardingSeen) ?? false;
    return flag;
  }
}