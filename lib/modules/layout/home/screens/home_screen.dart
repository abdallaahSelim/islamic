import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:islamic_app/core/widgets/background_widget.dart';
import 'package:islamic_app/modules/layout/hadeeth/screens/hadith_screen.dart';
import 'package:islamic_app/modules/layout/quran/screen/quran_screen.dart';
import 'package:islamic_app/modules/layout/radio/screens/radio_screen.dart';
import 'package:islamic_app/modules/layout/sabha/screens/sabha_screen.dart';
import 'package:islamic_app/modules/layout/setting/screens/setting.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'LayoutScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const RadioScreen(),
    const SabhaScreen(),
    const HadithsScreen(),
    QuranScreen(),
    const SettingScreen()
  ];
  var pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          getTranslation(context).islami,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
                  pageController.animateToPage(selectedIndex,
                      duration: const Duration(microseconds: 1),
                      curve: Curves.bounceInOut);
                });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/icons/radio_blue.png'),
                size: 32,
              ),
              label: getTranslation(context).radio),
          BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/icons/sebha.png'),
                size: 32,
              ),
              label: getTranslation(context).sabha),
          BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/icons/hades.png'),
                size: 32,
              ),
              label: getTranslation(context).hadith),
          BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/icons/quran.png'),
                size: 32,
              ),
              label: getTranslation(context).quran),
          BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: getTranslation(context).setting),
        ],
      ),
            body: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                physics: const BouncingScrollPhysics(),
                children: screens)));
  }
}
