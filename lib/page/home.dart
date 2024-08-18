import 'package:flutter/material.dart';
import 'package:tukita_learner/page/lesson.dart';
import 'package:tukita_learner/util.dart';
import 'package:tukita_learner/widget/wordbook/wordbook.dart';

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
          InkWell(
              child: const Text("Словарь"),
              onTap: () => openPage(Wordbook(), context)),
          InkWell(
              child: const Text("Урок 1: алфавит"),
              onTap: () => openPage(const Lesson(1), context)),
          InkWell(
              child: const Text("Урок 2: вопросительные слова"),
              onTap: () => openPage(const Lesson(2), context)),
          InkWell(
              child: const Text("Урок 3: местоимения"),
              onTap: () => openPage(const Lesson(3), context)),
          InkWell(
              child: const Text("Урок 4: составляем первые предложения"),
              onTap: () => openPage(const Lesson(4), context)),
          InkWell(
              child: const Text("Урок 5: самые часто-используемые слова"),
              onTap: () => openPage(const Lesson(5), context)),
          InkWell(
              child: const Text("Урок 6: вопросы \"кто/что/кем/чем\""),
              onTap: () => openPage(const Lesson(6), context)),
          InkWell(
              child: const Text("Урок 7: вопоросы \"где\""),
              onTap: () => openPage(const Lesson(7), context)),
          InkWell(
              child: const Text("Урок 8: вопоросы \"куда\""),
              onTap: () => openPage(const Lesson(8), context)),
        ]),
      ),
    );
  }
}
