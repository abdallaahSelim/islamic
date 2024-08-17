import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  String currentLocaleCode = 'en';
  static const localeKey = 'lang';
  final SharedPreferences prefs;

  LocaleProvider({required this.prefs}) {
    readSavedLocale();
  }

  void readSavedLocale() async {
    currentLocaleCode = await prefs.getString(localeKey) ?? 'en';
  }

  void saveLocale() async {
    prefs.setString(localeKey, currentLocaleCode);
  }

  void changeLocale(String newCode) {
    currentLocaleCode = newCode;
    notifyListeners();
    saveLocale();
  }

  String getCurrentLocaleText() {
    return currentLocaleCode == 'en' ? 'English' : 'العربية';
  }

  static LocaleProvider get(BuildContext context) {
    return Provider.of<LocaleProvider>(context);
  }
}
