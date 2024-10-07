import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/lesson.dart';
import 'package:tukita_learner/widget/lesson_navigation.dart';
import 'package:tukita_learner/widget/lesson_template.dart';

class HowtoUseWhoAndWhat extends StatelessWidget {
  static const String name = 'Урок 6: вопросы "кто/что" и "кем/чем"';

  const HowtoUseWhoAndWhat();

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(
        name,
        Column(children: [
          const Text(
              'Здесь мы научимся правильно задавать вопрос "кто" и "что", а также отвечать на них.'
              'Вопрос "Ты кто?" выглядит следующим образом: '
              'Мини чув эгув? Мини - ты. Чув - кто, но буква "в" в конце указывает на то, что спрашивают мужчину.'
              'То же самое с "эгуВ" (быть/являться). Если бы вопрос задавали женщине, то использовалось бы "чуЙ" и "эгуЙ".'
              'В ситуациях, где вы не знаете какого пола человек, по-умолчанию используется мужское местоимение.'
              'Например, вашей маме звонит тётя, вы взяли телефон и передаете его маме, она у вас спрашивает "чув эгув?"(кто это?) или "чув гарда эгув?"(кто звонит?).'),
          const Divider(),
          DataTable(columns: const [
            DataColumn(
                label: Text("-"),
                headingRowAlignment: MainAxisAlignment.center),
            DataColumn(
                label: Text("-"),
                headingRowAlignment: MainAxisAlignment.center),
          ], rows: const [
            DataRow(cells: [
              DataCell(Text("Чуб ги эгуб?")),
              DataCell(Text("Что будет нужно? Что понадобится?")),
            ]),
            DataRow(cells: [
              DataCell(Text("Чуб къамеду эгуб?")),
              DataCell(Text("Что есть поесть? Что будет съедено?")),
            ]),
            DataRow(cells: [
              DataCell(Text("Чуб къорагlеду эгуб?")),
              DataCell(Text("Что будет нужно? Что понадобится?")),
            ]),
            DataRow(cells: [
              DataCell(Text("Чуб къорагlеду эгуб?")),
              DataCell(Text("Что будет нужно? Что понадобится?")),
            ]),
            DataRow(cells: [
              DataCell(Text("Чуб инкведу эгув?")),
              DataCell(Text("Кто будет кушать?")),
            ]),
            DataRow(cells: [
              DataCell(Text("Чуй йиэду эгуй?")),
              DataCell(Text("Кто(женщина) пойдет?")),
            ]),
          ]),
          //ElevatedButton(onPressed: () => openPage(generateTest(), context), child: const Text("Пройти тест")),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LessonNavigationButton(LessonName.popularWords),
              //LessonNavigationButton(lessonId: 4, caption: QuestionWords.name),
            ],
          ),
        ]));
  }
}
