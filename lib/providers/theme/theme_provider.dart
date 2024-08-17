import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  static const String isDarkTheme = "theme";
  final SharedPreferences prefs;

  ThemeProvider({required this.prefs}) {
    readSavedThemeMode();
  }

  void readSavedThemeMode() async {
    var isDark = prefs.getBool(isDarkTheme) ?? false;
    currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void saveThemeMode() async {
    prefs.setBool(isDarkTheme, isDarkEnable());
  }

  bool isDarkEnable() {
    return currentTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
    saveThemeMode();
  }

  String getCurrentThemeText(BuildContext context) {
    return currentTheme == ThemeMode.dark
        ? getTranslation(context).dark
        : getTranslation(context).light;
  }

  static ThemeProvider get(BuildContext context) {
    return Provider.of<ThemeProvider>(context);
  }
}
