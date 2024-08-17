import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/get_image_path.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:islamic_app/modules/layout/hadeeth/widgets/hadith_title.dart';

class HadithsScreen extends StatelessWidget {
  static const String routeName = 'HadesScreen';

  const HadithsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image(
          height: size.height * 0.3,
          image: AssetImage(getImagePath('hadith_header')),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          height: 2,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(getTranslation(context).hadiths,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          height: 2,
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return HadithTitle(fileIndex: index);
              },
              itemCount: 50),
        )
      ],
    );
  }
}

class Hadith {
  String title;
  String content;

  Hadith({required this.title, required this.content});
}
