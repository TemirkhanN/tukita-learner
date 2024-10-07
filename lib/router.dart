import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukita_learner/screen/home.dart';
import 'package:tukita_learner/screen/lesson.dart';
import 'package:tukita_learner/screen/system.dart';
import 'package:tukita_learner/widget/wordbook/wordbook.dart';

class Route {
  static const String home = "/";
  static const String wordbook = "/wordbook";
  static const String lesson = "/lesson/:name";
}

extension AppNavigation on BuildContext {
  void goToLesson(LessonName name) {
    go(Route.lesson.replaceFirst("/:name", "/${name.name}"));
  }

  void goToWordBook() {
    return go(Route.wordbook);
  }
}

final router = GoRouter(routes: [
  GoRoute(path: Route.home, builder: (context, state) => HomePage()),
  GoRoute(path: Route.wordbook, builder: (context, state) => const Wordbook()),
  GoRoute(
      path: Route.lesson,
      builder: (context, state) {
        LessonName? lesson = LessonName.values
            .firstWhereOrNull((l) => l.name == state.pathParameters['name']);

        if (lesson != null) {
          return Lesson(lesson);
        }

        // TODO
        return const SystemMessage("Unknown lesson");
      }),
]);
