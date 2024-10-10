import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukita_learner/screen/chapter.dart';

class ChapterNavigationButton extends StatelessWidget {
  final ChapterRef chapter;

  const ChapterNavigationButton(this.chapter);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => context.go("/chapter/${chapter.id}"), child: Text(chapter.description));
  }
}
