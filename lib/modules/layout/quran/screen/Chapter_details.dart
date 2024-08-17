import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/widgets/background_widget.dart';
import 'package:islamic_app/modules/layout/quran/widgets/verse_content.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const routeName = 'ChapterDetailsScreen';

  const ChapterDetailsScreen({super.key});

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var arg = ModalRoute.of(context)!.settings.arguments as ChapterDetailsArg;

    if (verses.isEmpty) {
      _readSuraData(arg.index);
    }

    return BackgroundWidget(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                arg.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
            body: Card(
              elevation: 24,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
              child: verses.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Expanded(
                            child: Divider(
                              height: 3,
                              indent: 10,
                              endIndent: 10,
                              thickness: 3,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            '(${index + 1})',
                          ),
                          Expanded(
                            child: Divider(
                              height: 3,
                              indent: 10,
                              endIndent: 10,
                              thickness: 3,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                      itemBuilder: (context, index) =>
                          VerseContent(size: size, aya: verses[index]),
                      itemCount: verses.length,
                    ),
            )));
  }

  void _readSuraData(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/suras/${fileIndex + 1}.txt');
    List<String> lines = fileContent.trim().split('\n');
    setState(() {
      verses = lines;
    });
  }
}

class ChapterDetailsArg {
  String title;
  int index;
  ChapterDetailsArg({required this.title, required this.index});
}
