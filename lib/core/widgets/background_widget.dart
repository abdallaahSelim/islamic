import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class BackgroundWidget extends StatelessWidget {
  Widget child;

  BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkEnable();
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(isDark
                    ? 'assets/images/bg_dark.png'
                    : 'assets/images/bg3.png'),
                fit: BoxFit.cover)),
        child: child,
      ),
    );
  }
}
