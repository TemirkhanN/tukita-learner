import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/lesson/alphabet.dart';
import 'package:tukita_learner/screen/lesson/basic_sentences.dart';
import 'package:tukita_learner/screen/lesson/howto_use_where.dart';
import 'package:tukita_learner/screen/lesson/howto_use_whereto.dart';
import 'package:tukita_learner/screen/lesson/howto_use_who_and_what.dart';
import 'package:tukita_learner/screen/lesson/popular_words.dart';
import 'package:tukita_learner/screen/lesson/pronouns.dart';
import 'package:tukita_learner/screen/lesson/question_words.dart';

enum LessonName {
  alphabet,
  questionWords,
  pronouns,
  basicSentences,
  popularWords,
  howtoUseWhoAndWhat,
  howtoUseWhere,
  howtoUseWhereto,
}

class Lesson extends StatelessWidget {
  final LessonName name;

  // TODO cohesion between lesson number, name and the instance itself is broken
  static const Map<LessonName, Widget> _lessons = {
    LessonName.alphabet: Alphabet(),
    LessonName.questionWords: QuestionWords(),
    LessonName.pronouns: Pronouns(),
    LessonName.basicSentences: BasicSentences(),
    LessonName.popularWords: PopularWords(),
    LessonName.howtoUseWhoAndWhat: HowtoUseWhoAndWhat(),
    LessonName.howtoUseWhere: HowtoUseWhere(),
    LessonName.howtoUseWhereto: HowtoUseWhereto(),
  };

  const Lesson(this.name);

  @override
  Widget build(BuildContext context) {
    return _lessons[name]!;
  }
}
