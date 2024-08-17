import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:islamic_app/providers/theme/theme_provider.dart';

class SabhaScreen extends StatefulWidget {
  static const  String routeName = 'SabhaScreen';

  const SabhaScreen({super.key});

  @override
  State<SabhaScreen> createState() => _SabhaScreenState();
}

class _SabhaScreenState extends State<SabhaScreen> {
  int praisesNumber = 0;
  int selectedPraise = 0;
  List<String> praisesName = [
    'سبحان الله',
    'الحمد الله',
    'الله اكبر',
    'لا إله إلا الله وحده لا شريك له، له الملك، وله الحمد، وهو على كل شيء قدير'
  ];
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var themeProvider = ThemeProvider.get(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 64),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 79),
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 150),
                  child: Image(
                    fit: BoxFit.cover,
                    width: themeProvider.isDarkEnable()
                        ? size.width * 0.6
                        : size.width * 0.8,
                    height: themeProvider.isDarkEnable()
                        ? size.height * 0.29
                        : size.height * 0.3,
                    image: themeProvider.isDarkEnable()
                        ? const AssetImage('assets/images/dark-body of seb7a.png')
                        : const AssetImage('assets/images/body of seb7a.png'),
                  ),
                ),
              ),
              Positioned(
                left: themeProvider.isDarkEnable()
                    ? (size.width * 0.28)
                    : (size.width * 0.35),
                bottom: size.height * 0.265,
                child: Image(
                  fit: BoxFit.cover,
                  width: size.width * 0.18,
                  height: size.height * 0.11,
                  image: themeProvider.isDarkEnable()
                      ? const AssetImage('assets/images/dark-head of seb7a.png')
                      : const AssetImage('assets/images/head of seb7a.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.01, top: 20),
            child: Text(getTranslation(context).numberOfPraises,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          Container(
            width: size.width * 0.2,
            height: size.height * 0.08,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child: Center(
                child: Text('$praisesNumber', style: const TextStyle(fontSize: 25))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    turns += 1 / 18;
                    praisesNumber++;
                    if (selectedPraise == 3) {
                      praisesNumber = 0;
                      selectedPraise = 0;
                    } else {
                      if (praisesNumber == 34) {
                        praisesNumber = 0;
                        selectedPraise++;
                      }
                    }
                  });
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  praisesName[selectedPraise],
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).cardColor))),
          ),
        ],
      ),
    );
  }
}
