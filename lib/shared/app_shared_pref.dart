import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localekey = 'app_locale';
  static Future<void> setAppLocale(String locale) async{
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(localekey, locale);
  }

  static Future<String> getAppLocale() async{
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(localekey) ?? 'es';
  }
}
