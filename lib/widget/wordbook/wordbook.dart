import 'package:flutter/material.dart';
import 'package:tukita_learner/util.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';
import 'package:tukita_learner/widget/wordbook/chapter.dart' as ui;

class Wordbook extends StatelessWidget {
  final Vocabulary vocabulary = const Vocabulary();

  const Wordbook({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> chapterNames = vocabulary.chaptersNames();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Словарь"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10.0, // Spacing between columns
          maxCrossAxisExtent: 250,
        ),
        itemCount: chapterNames.length,
        itemBuilder: (BuildContext context, int index) {
          String chapterName = chapterNames[index];
          final Chapter chapter = vocabulary.chapter(chapterName);

          // TODO vertical spacing between columns
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Image.network(chapter.cover, width: 150)),
                Text(chapterName),
                ElevatedButton(
                  onPressed: () =>
                      openPage(ui.Chapter(chapterName, chapter.words), context),
                  child: const Text('Открыть'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
