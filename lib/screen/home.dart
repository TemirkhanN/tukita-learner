import 'package:flutter/material.dart';
import 'package:tukita_learner/router.dart';
import 'package:tukita_learner/screen/lesson.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Изучение тукитинского языка"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          const Text(
            "Это краш-курс тукитинского языка. Наша задача максимально быстро научить вас понимать тукитинский и, по-возможности, говорить на нем."
            "Данный материал не подходит филологам - систематизация, которую мы будем использовать, не совпадает с общепринятой практикой."
            "Прежде чем мы начнем, я хочу отметить, что даже если вы будете путать все существующие правила и говорить максимально косноязычно, ничего страшного."
            "В нашем языке нет строгого порядка слов и его первобытная простота позволяют понимать вас даже если вы говорите неправильно."
            "Не переживайте, чуть чаще практикуйтесь со своими родными, и всё придет само собой. Удачи!\n",
            softWrap: true,
          ),
          InkWell(onTap: context.goToWordBook, child: const Text("Словарь")),
          InkWell(
              child: const Text("Урок 1: алфавит"),
              onTap: () => context.goToLesson(LessonName.alphabet)),
          InkWell(
              child: const Text("Урок 2: вопросительные слова"),
              onTap: () => context.goToLesson(LessonName.questionWords)),
          InkWell(
              child: const Text("Урок 3: местоимения"),
              onTap: () => context.goToLesson(LessonName.pronouns)),
          InkWell(
              child: const Text("Урок 4: составляем первые предложения"),
              onTap: () => context.goToLesson(LessonName.basicSentences)),
          InkWell(
              child: const Text("Урок 5: самые часто-используемые слова"),
              onTap: () => context.goToLesson(LessonName.popularWords)),
          InkWell(
              child: const Text("Урок 6: вопросы \"кто/что/кем/чем\""),
              onTap: () => context.goToLesson(LessonName.howtoUseWhoAndWhat)),
          InkWell(
              child: const Text("Урок 7: вопоросы \"где\""),
              onTap: () => context.goToLesson(LessonName.howtoUseWhere)),
          InkWell(
              child: const Text("Урок 8: вопоросы \"куда\""),
              onTap: () => context.goToLesson(LessonName.howtoUseWhereto)),
        ]),
      ),
    );
  }
}
