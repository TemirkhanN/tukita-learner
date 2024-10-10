import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/chapter/alphabet.dart';
import 'package:tukita_learner/screen/chapter/question_words.dart';

import 'chapter/basic_sentences.dart';
import 'chapter/howto_use_where.dart';
import 'chapter/howto_use_whereto.dart';
import 'chapter/howto_use_who_and_what.dart';
import 'chapter/popular_words.dart';
import 'chapter/pronouns.dart';

class ChapterRef {
  final String id;
  final String description;

  const ChapterRef(this.id, this.description);
}

class TableOfContents {
  static List<ChapterRef> list() {
    return const [
      Alphabet.reference,
      QuestionWords.reference,
      Pronouns.reference,
      BasicSentences.reference,
      PopularWords.reference,
      HowtoUseWhoAndWhat.reference,
      HowtoUseWhere.reference,
      HowtoUseWhereto.reference,
    ];
  }

  static Widget? resolve(String chapterId) {
    if (chapterId == Alphabet.reference.id) {
      return const Alphabet();
    }

    if (chapterId == QuestionWords.reference.id) {
      return const QuestionWords();
    }

    if (chapterId == Pronouns.reference.id) {
      return const Pronouns();
    }
    if (chapterId == BasicSentences.reference.id) {
      return const BasicSentences();
    }
    if (chapterId == PopularWords.reference.id) {
      return const PopularWords();
    }
    if (chapterId == HowtoUseWhoAndWhat.reference.id) {
      return const HowtoUseWhoAndWhat();
    }
    if (chapterId == HowtoUseWhere.reference.id) {
      return const HowtoUseWhere();
    }
    if (chapterId == HowtoUseWhereto.reference.id) {
      return const HowtoUseWhereto();
    }

    return null;
  }
}
