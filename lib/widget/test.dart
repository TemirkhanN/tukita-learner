import 'package:flutter/material.dart';
import 'package:tukita_learner/test.dart';
import 'package:tukita_learner/util.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';

class StartTestButton extends StatelessWidget {
  final TestWidget _test;
  final String caption;
  const StartTestButton(this._test, {this.caption = "Пройти тест"});

  StartTestButton.translation(List<Word> dictionary)
      : this(TestWidget._translationTest(dictionary));

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => openPage(_test, context), child: Text(caption));
  }
}

class TestWidget extends StatefulWidget {
  final Test _test;

  const TestWidget(this._test);

  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }

  TestWidget._translationTest(List<Word> dictionary)
      : this(TestGenerator.generateTranslationTest(dictionary));
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    var currentTest = widget._test;
    if (currentTest.isFinished()) {
      return TestResult(currentTest);
    }

    // TODO doable via PageView widget. Maybe even better that way
    Question question = currentTest.getCurrentQuestion()!;

    return Scaffold(
        appBar: AppBar(
          title: Text(question.text()),
        ),
        body: ListView.separated(
          itemCount: question.options().length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            Option option = question.getOption(index);
            return TextButton(
                child: Text(option.value),
                onPressed: () {
                  setState(() {
                    currentTest.provideAnswer(Answer(value: index));
                  });
                });
          },
        ));
  }
}

class TestResult extends StatelessWidget {
  final Test test;

  const TestResult(this.test);

  @override
  Widget build(BuildContext context) {
    if (!test.isFinished()) {
      // TODO invariance error notification
      throw Error();
    }

    var result = test.getResult();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Результат теста"),
        ),
        body: ListView.separated(
            itemCount: test.getResult().length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              var question = result[index];

              return Row(children: [
                Icon(
                  question.isAnsweredCorrectly()
                      ? Icons.check_box
                      : Icons.details,
                  color: question.isAnsweredCorrectly()
                      ? Colors.green
                      : Colors.yellow,
                ),
                Text(question.text()),
              ]);
            }));
  }
}
