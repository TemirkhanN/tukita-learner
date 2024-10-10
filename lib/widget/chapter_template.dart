import 'package:flutter/material.dart';
import 'package:tukita_learner/widget/template.dart';

class ChapterTemplate extends StatelessWidget {
  final String name;
  final Widget content;

  const ChapterTemplate(this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: MobileTemplate(
          body: content,
        ));
  }
}
