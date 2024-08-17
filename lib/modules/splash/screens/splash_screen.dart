import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic_app/modules/layout/home/screens/home_screen.dart';
import 'package:islamic_app/providers/theme/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    return themeProvider.isDarkEnable()
        ? Image.asset('assets/images/dark_splash.png')
        : Image.asset('assets/images/splash.png');
  }
}
