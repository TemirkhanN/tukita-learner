import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/lesson.dart';
import 'package:tukita_learner/widget/lesson_navigation.dart';
import 'package:tukita_learner/widget/lesson_template.dart';
import 'package:tukita_learner/widget/test.dart';

class BasicSentences extends StatelessWidget {
  static const String name = "Урок 4: составляем базовые предложения";

  const BasicSentences();

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(
        name,
        Column(children: [
          const Text(
              'Теперь, когда мы разобрались с местоименияи, пора приступать к простой практике.'
              'Здесь будут первые ощутимые сложности, поскольку в тукитинском языке глаголы часто имеют непривычную форму для человека, говорящего по-русски.'
              'Вместо "я покупаю хлеб" мы говорим "хлеб покупается мной". Не всегда, но очень часто.'
              'Для желающих я предоставлю учебник с правилами, которые детально раскрывают тему, но в базовом курсе будут практические примеры.'),
          const Divider(),
          // TODO needs test input
          StartTestButton.translation(const []),
          const LessonNavigationButton(LessonName.popularWords),
        ]));
  }
}
