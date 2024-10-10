import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/chapter.dart';
import 'package:tukita_learner/screen/chapter/alphabet.dart';
import 'package:tukita_learner/screen/chapter/pronouns.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';
import 'package:tukita_learner/widget/chapter_navigation.dart';
import 'package:tukita_learner/widget/chapter_template.dart';
import 'package:tukita_learner/widget/test.dart';

class QuestionWords extends StatelessWidget {
  static const ChapterRef reference = ChapterRef("question-words", "Вопросительные слова");

  static const List<Word> _dictionary = [
    Word('что', 'чуб', ''),
    Word('кто(он)', 'чув', ''),
    Word('кто(она)', 'чуй', ''),
    Word('какая', 'гьаштуй', ''),
    Word('какой', 'гьаштув', ''),
    Word('какое', 'гьаштуб', ''),
    Word('какие(люди)', 'гьаштубе', ''),
    Word('какие(вещи или животные)', 'гьаштуре', ''),
    Word('как', 'гьашта', ''),
    Word('когда', 'чунда', ''),
    Word('где', 'гьанкlу', ''),
    Word('куда', 'гьанди', ''),
  ];

  const QuestionWords();

  @override
  Widget build(BuildContext context) {
    return ChapterTemplate(
        reference.description,
        Column(children: [
          const Text("Для общения очень часто нужны уточнения и вопросы. Постарайтесь запомнить следующие слова, которые вам в этом помогут.\n"
              "Вы будете часто их использовать, поэтому можно держать этот список под рукой.\n"
              "что - чуб\n"
              "кто(он) - чув\n"
              "кто(она) - чуй\n"
              "как - гьашта\n"
              "когда - чунда\n"
              "где - гьанкlу\n"
              "куда - гьанди\n"
              "какой - гьаштув\n"
              "какая - гьаштуй\n"
              "какое - гьаштуб\n"
              "какие(люди) - гьаштубе\n"
              "какие(вещи или животные) - гьаштуре\n"),
          StartTestButton.translation(_dictionary),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChapterNavigationButton(Alphabet.reference),
              ChapterNavigationButton(Pronouns.reference),
            ],
          ),
        ]));
  }
}
