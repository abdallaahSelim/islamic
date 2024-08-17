import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:islamic_app/providers/theme/theme_provider.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = 'RadioScreen';

  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: width,
              height: height * 0.25,
              image: const AssetImage(
                  "assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(getTranslation(context).holyQuranRadio,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(themeProvider.isDarkEnable()
                            ? 'assets/icons/dark-metro-prev.png'
                            : 'assets/icons/Icon metro-back.png'),
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(themeProvider.isDarkEnable()
                            ? 'assets/icons/dark-awesome-play.png'
                            : 'assets/icons/Icon awesome-play.png'),
                        size: 35,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(themeProvider.isDarkEnable()
                            ? 'assets/icons/dark-metro-next.png'
                            : 'assets/icons/Icon metro-next.png'),
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
