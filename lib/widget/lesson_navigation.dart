import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukita_learner/screen/lesson.dart';

class LessonNavigationButton extends StatelessWidget {
  final LessonName lesson;

  const LessonNavigationButton(this.lesson);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.go("/lesson/${lesson.name}"),
        child: Text(lesson.name));
  }
}
