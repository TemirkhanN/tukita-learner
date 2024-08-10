import 'package:flutter/material.dart';
import 'package:namer_app/vocabulary/vocabulary.dart';
import 'package:namer_app/widget/wordbook/chapter.dart' as ui;

class Wordbook extends StatelessWidget {
  final Vocabulary vocabulary = Vocabulary();

  @override
  Widget build(BuildContext context) {
    final List<String> chapterNames = vocabulary.chaptersNames();

    return Scaffold(
      appBar: AppBar(
        title: Text("Словарь"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: chapterNames.length,
        itemBuilder: (BuildContext context, int index) {
          String chapterName = chapterNames[index];
          final Chapter chapter = vocabulary.chapter(chapterName);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Image.network(chapter.cover, width: 150)),
                Text(chapterName),
                ElevatedButton(
                  onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ui.Chapter(chapterName, chapter.words)));
                  },
                  child: Text('Открыть'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
