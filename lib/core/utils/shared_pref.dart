import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String afterOnboardingKey = 'AfterOnboarding';

  static Future<void> setKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = prefs.getBool(afterOnboardingKey) ?? false;
    flag = true;
    prefs.setBool(afterOnboardingKey, flag);
  }

  static Future<bool> getKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = prefs.getBool(afterOnboardingKey) ?? false;
    return flag;
  }
}