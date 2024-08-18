import 'package:flutter/material.dart';

import '../../vocabulary/vocabulary.dart';

class Chapter extends StatelessWidget {
  final String name;
  final List<Word> words;

  // const for constructor, basically, means readonly class. It can be applied only if props are final
  const Chapter(this.name, this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 1
          ),
          padding: const EdgeInsets.all(8),
          itemCount: words.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Image.network(words[index].picture, width: 150)),
                  Text(words[index].origin),
                  Text(words[index].translation),
                ],
              ),
            );
          }),
    );
  }
}
