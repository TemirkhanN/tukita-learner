import 'package:flutter/material.dart';
import 'package:tukita_learner/util.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tukita_learner/widget/test.dart' as testUI;
import 'package:tukita_learner/test.dart' as testModel;

class Lesson extends StatelessWidget {
  final int number;

  const Lesson(this.number);

  @override
  Widget build(BuildContext context) {
    switch (number) {
      case 1:
        return const _Lesson1();
      case 2:
        return const _Lesson2();
      default:
        throw UnsupportedError("Lesson $number is not supported");
    }
  }
}

abstract class _LessonTemplate extends StatelessWidget {
  final String _name;

  const _LessonTemplate(this._name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Column(
          children: [
            buildContent(context),
            buildNavigation(context),
          ],
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context);

  Widget buildNavigation(BuildContext context);
}

class _Lesson1 extends _LessonTemplate {
  static const String name = "Урок 1: алфавит";

  const _Lesson1() : super(name);

  @override
  Widget buildContent(BuildContext context) {
    return Column(children: [
      const Text(
        "В тукитинском языке присутствуют все буквы русского алфавита, плюс особенные комбинации."
        "Поскольку тукитинский отличается от аварского написанием ровно одной буквы, я рекомендую просто воспользоваться им."
        "Он гораздо распространеннее, а на ютубе и в других местах полно справочников о том, как писать и читать, поэтому это сильно упрощает обучение. Я прикреплю ссылку на одно из таких видел чуть ниже."
        "Суммарно, вам нужно знать русский алфавит плюс буквы из таблицы ниже.\n",
        softWrap: true,
      ),
      const Text("Гl гl Гь гь Гъ гъ"),
      const Text("Кl кl Кь кь Къ къ"),
      const Text("Тl тl	Лъ лъ"),
      const Text("Хl хl	Хь хь	Хъ хъ"),
      const Text("Цl цl	Чl чl"),
      ElevatedButton(
          onPressed: () => _openYoutubeVideo("https://youtu.be/NJmdP4IC328"),
          child: const Text("⏵ Видеоурок")),
    ]);
  }

  @override
  Widget buildNavigation(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () => openPage(const _Lesson2(), context),
            child: const Text("${_Lesson2.name} →")),
      ],
    );
  }

  Future<void> _openYoutubeVideo(String link) async {
    var url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class _Lesson2 extends _LessonTemplate {
  static const String name = "Урок 2: Вопросительные слова";

  final List<Word> _dictionary = const [
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

  // Can't make it const because Unmodifiable map isn't considered const
  const _Lesson2() : super(name);

  @override
  Widget buildContent(BuildContext context) {
    return Column(children: [
      const Text(
          "Для общения очень часто нужны уточнения и вопросы. Постарайтесь запомнить следующие слова, которые вам в этом помогут.\n"
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
      ElevatedButton(onPressed: () => openPage(generateTest(), context), child: const Text("Пройти тест")),
    ]);
  }

  @override
  Widget buildNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () => openPage(const _Lesson1(), context),
            child: const Text("← ${_Lesson1.name}")),
        ElevatedButton(
            onPressed: () => print(2),
            child: const Text("Урок 3: местоимения →")),
      ],
    );
  }

  testUI.Test generateTest() {
    var test = testModel.generateTranslationTest(_dictionary);

    return testUI.Test(test);
  }
}
