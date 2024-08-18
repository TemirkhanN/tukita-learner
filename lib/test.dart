import 'package:tukita_learner/util.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';

class Option {
  final String value;
  final bool isCorrect;

  const Option(this.value, this.isCorrect);
}

class Answer {
  final int targetId;
  final int value;

  const Answer({required this.value, this.targetId = 1});
}

abstract interface class Question {
  String text();
  bool isResolved();
  List<Option> options();

  bool isAnsweredCorrectly();

  Option getOption(int index);

  void apply(Option answer);
}

class ChoiceQuestion implements Question {
  final String _text;
  final List<Option> _options;

  Option? _providedAnswer;

  ChoiceQuestion(this._text, this._options);

  @override
  void apply(Option answer) {
    if (isResolved()) {
      throw Error();
    }

    _providedAnswer = answer;
  }

  @override
  bool isResolved() {
    return _providedAnswer != null;
  }

  @override
  bool isAnsweredCorrectly() {
    return _providedAnswer?.isCorrect ?? false;
  }

  @override
  String text() {
    return _text;
  }

  @override
  List<Option> options() {
    return _options;
  }

  @override
  Option getOption(int index) {
    return _options[index];
  }
}

class Test {
  final List<Question> questions;
  int _currentQuestionNumber = 0;

  Test(this.questions);

  void provideAnswer(Answer answer) {
    var question = getCurrentQuestion();
    if (question == null) {
      throw Exception("No current question to answer");
    }

    Option choice = question.options()[answer.value];

    question.apply(choice);
    if (question.isResolved()) {
      _currentQuestionNumber++;
    }
  }

  bool isFinished() {
    return _currentQuestionNumber == questions.length;
  }

  List<Question> getResult() {
    // TODO throw error maybe
    if (!isFinished()) {
      return [];
    }

    return questions;
  }

  Question? getCurrentQuestion() {
    if (isFinished()) {
      return null;
    }

    return questions[_currentQuestionNumber];
  }
}

Test generateTranslationTest(List<Word> dictionary) {
  const amountOfOptions = 4;

  List<Question> questions = dictionary.map((Word word) {
    List<Option> options =
        randomValues(amountOfOptions, dictionary, excluding: word)
            .map((randomWord) => Option(randomWord.translation, false))
            .toList();

    options.add(Option(word.translation, true));

    return ChoiceQuestion('Как сказать "${word.origin}?"', options);
  }).toList(growable: false);

  return Test(questions);
}
