import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/chapter.dart';
import 'package:tukita_learner/screen/chapter/question_words.dart';
import 'package:tukita_learner/widget/chapter_navigation.dart';
import 'package:tukita_learner/widget/chapter_template.dart';
import 'package:tukita_learner/widget/youtube.dart';

class Alphabet extends StatelessWidget {
  static const ChapterRef reference = ChapterRef("alphabet", "Алфавит");

  const Alphabet();

  @override
  Widget build(BuildContext context) {
    return ChapterTemplate(
        reference.description,
        const Column(
          children: [
            Column(children: [
              Text(
                "В тукитинском языке присутствуют все буквы русского алфавита, плюс особенные комбинации."
                "Поскольку тукитинский отличается от аварского написанием ровно одной буквы, я рекомендую просто воспользоваться им."
                "Он гораздо распространеннее, а на ютубе и в других местах полно справочников о том, как писать и читать, поэтому это сильно упрощает обучение. Я прикреплю ссылку на одно из таких видел чуть ниже."
                "Суммарно, вам нужно знать русский алфавит плюс буквы из таблицы ниже.\n",
                softWrap: true,
              ),
              Text("Гl гl Гь гь Гъ гъ"),
              Text("Кl кl Кь кь Къ къ"),
              Text("Тl тl	Лъ лъ"),
              Text("Хl хl	Хь хь	Хъ хъ"),
              Text("Цl цl	Чl чl"),
              YoutubeLinkButton("Видеоурок", "https://youtu.be/NJmdP4IC328"),
            ]),
            Row(
              children: [
                ChapterNavigationButton(QuestionWords.reference),
              ],
            ),
          ],
        ));
  }
}
