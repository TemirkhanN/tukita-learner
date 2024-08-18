import 'package:flutter/material.dart';
import 'package:tukita_learner/test.dart' as testModel;

class Test extends StatefulWidget {
  final testModel.Test _test;

  const Test(this._test);

  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    testModel.Test currentTest = widget._test;
    if (currentTest.isFinished()) {
      return TestResult(currentTest);
    }

    testModel.Question question = currentTest.getCurrentQuestion()!;

    return Scaffold(
        appBar: AppBar(
          title: Text(question.text()),
        ),
        body: ListView.separated(
          itemCount: question.options().length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            testModel.Option option = question.getOption(index);
            return TextButton(
                child: Text(option.value),
                onPressed: () {
                  setState(() {
                    currentTest.provideAnswer(testModel.Answer(value: index));
                  });
                });
          },
        ));
  }
}

class TestResult extends StatelessWidget {
  final testModel.Test test;

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
