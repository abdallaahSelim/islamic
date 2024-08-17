import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimaly = const Color(0xffB7935F);
  static Color lightSecondary = Colors.white;

  static Color darkPrimaly = const Color(0xff141A2E);
  static Color darkSecondary = const Color(0xffFACC1D);

  static ThemeData light = ThemeData(
      splashColor: lightPrimaly,
      cardColor: Colors.white,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.white),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            color: Color(0xff242424),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'elMessiri'),
        titleMedium: TextStyle(
            color: Color(0xff242424),
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Messiri'),
        titleLarge: TextStyle(
            color: Color(0xff242424),
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Messiri'),
        bodySmall: TextStyle(
            color: Color(0xff242424),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Messiri'),
        bodyMedium: TextStyle(
            color: Color(0xff242424),
            fontWeight: FontWeight.w600,
            fontSize: 25,
            fontFamily: 'Messiri'),
        bodyLarge: TextStyle(color: Color(0xff242424)),
      ),
      cardTheme: CardTheme(
          color: lightSecondary,
          elevation: 24,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
          surfaceTintColor: null),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: lightPrimaly,
      ),
      dividerColor: lightPrimaly,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        minimumSize: const Size(137, 51),
        backgroundColor: lightPrimaly,
      )),
      colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimaly,
        primary: lightSecondary,
        onPrimary: Colors.white,
        secondary: lightPrimaly,
        onSecondary: lightPrimaly,
        tertiary: darkPrimaly,
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 25,
          ),
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xff242424),
            fontSize: 30,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: const TextStyle(fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        type: BottomNavigationBarType.fixed,
        backgroundColor: lightPrimaly,
        selectedItemColor: const Color(0xff242424),
        unselectedItemColor: Colors.white,
      ));
  static ThemeData dark = ThemeData(
      splashColor: darkSecondary,
      cardColor: darkPrimaly,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: darkPrimaly),
      textTheme: TextTheme(
        titleSmall: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'elMessiri'),
        titleMedium: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Messiri'),
        titleLarge: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Messiri'),
        bodySmall: TextStyle(
            color: darkSecondary,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Messiri'),
        bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            fontFamily: 'Messiri'),
        bodyLarge: const TextStyle(color: Colors.white),
      ),
      cardTheme: CardTheme(
          color: darkPrimaly,
          elevation: 24,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
          surfaceTintColor: null),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: darkSecondary,
      ),
      dividerColor: darkSecondary,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              minimumSize: const Size(137, 51),
              backgroundColor: darkSecondary,
              foregroundColor: Colors.black)),
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkPrimaly,
          primary: darkPrimaly,
          onPrimary: lightSecondary,
          secondary: darkSecondary,
          onSecondary: darkPrimaly,
          tertiary: Colors.cyanAccent),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: lightSecondary,
            fontSize: 30,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: const TextStyle(fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        type: BottomNavigationBarType.fixed,
        backgroundColor: darkPrimaly,
        selectedItemColor: darkSecondary,
        unselectedItemColor: Colors.white,
      ));
}
