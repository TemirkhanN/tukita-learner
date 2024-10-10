import 'package:flutter/material.dart';

class ChapterTemplate extends StatelessWidget {
  final String name;
  final Widget content;

  const ChapterTemplate(this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: content,
        )));
  }
}
