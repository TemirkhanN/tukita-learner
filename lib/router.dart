import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukita_learner/screen/chapter.dart';
import 'package:tukita_learner/screen/home.dart';
import 'package:tukita_learner/screen/system.dart';
import 'package:tukita_learner/widget/wordbook/wordbook.dart';

class Route {
  static const String home = "/";
  static const String wordbook = "/wordbook";
  static const String chapter = "/chapter/:name";
}

extension AppNavigation on BuildContext {
  void openChapter(ChapterRef ref) {
    go(Route.chapter.replaceFirst("/:name", "/${ref.id}"));
  }

  void openWordbook() {
    return go(Route.wordbook);
  }
}

final router = GoRouter(routes: [
  GoRoute(path: Route.home, builder: (context, state) => HomePage()),
  GoRoute(path: Route.wordbook, builder: (context, state) => const Wordbook()),
  GoRoute(
      path: Route.chapter,
      builder: (context, state) {
        var chapter = TableOfContents.resolve(state.pathParameters['name']!);
        if (chapter != null) {
          return chapter;
        }

        // TODO
        return const SystemMessage("Unknown chapter");
      }),
]);
