import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:islamic_app/core/widgets/background_widget.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String routeName = 'HadithDetailsScreen';

  const HadithDetailsScreen({super.key});

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  List<String> hadith = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as HadithDetailsArg;

    if (hadith.isEmpty) {
      _readHadithFile(arg.fileIndex);
    }

    return BackgroundWidget(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          getTranslation(context).islami,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Card(
          child: hadith.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        hadith[0],
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontFamily: 'inter')),
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                      indent: 75,
                      color: Theme.of(context).dividerColor,
                      endIndent: 75,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: hadith.length - 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                hadith[index + 1],
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
    ));
  }

  void _readHadithFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/hadith/h${fileIndex + 1}.txt');
    List<String> lines = fileContent.trim().split('\n');
    setState(() {
      hadith = lines;
    });
  }
}

class HadithDetailsArg {
  int fileIndex;

  HadithDetailsArg({required this.fileIndex});
}
