import 'package:flutter/material.dart';
import 'package:tukita_learner/router.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';
import 'package:tukita_learner/widget/lesson_template.dart';

class PopularWords extends StatelessWidget {
  static const String name = "Урок 5: часто используемые слова";

  static const List<Word> words = [
    Word('я', 'дини', ''),
    Word('ты', 'мини', ''),
    Word('он', 'гьов', ''),
    Word('она', 'гьой', ''),
    Word('оно', 'гьоб', ''),
    Word('мной', 'динди', ''),
    Word('тобой', 'минди', ''),
    Word('им', 'гьошуд', ''),
    Word('ею', 'гьолъид', ''),
  ];

  const PopularWords();

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(
        name,
        Column(children: [
          const Text(
              'В повседневной жизни мы общаемся очень ограниченным количеством слов.'
              'Поэтому, если выучить десяток-другой популярныхслов и глаголов, вы уже сможете бегло изъясняться.'),
          const Divider(),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text("Слово"),
                  headingRowAlignment: MainAxisAlignment.center),
              DataColumn(
                  label: Text("Значение"),
                  headingRowAlignment: MainAxisAlignment.center),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text("Эгу")),
                DataCell(Text("Быть/Есть/Являться")),
              ]),
              DataRow(cells: [
                DataCell(Text("Гигьеду")),
                DataCell(Text("Делать")),
              ]),
              DataRow(cells: [
                DataCell(Text("Инкведу")),
                DataCell(Text("Кушать/Питаться")),
              ]),
              DataRow(cells: [
                DataCell(Text("Къамеду")),
                DataCell(Text("Есть (хлеб и т.п.)")),
              ]),
              DataRow(cells: [
                DataCell(Text("Галеду")),
                DataCell(Text("Говорить (с кем-то)/Звонить (по телефону)")),
              ]),
              DataRow(cells: [
                DataCell(Text("Бигьеду")),
                DataCell(Text("Брать/Покупать")),
              ]),
              DataRow(cells: [
                DataCell(Text("Бихьеду")),
                DataCell(Text("Давать/Продавать")),
              ]),
              DataRow(cells: [
                DataCell(Text("Муэду/Вуэду/Йиэду")),
                DataCell(Text("Идти")),
              ]),
              DataRow(cells: [
                DataCell(Text("Вохьэду")),
                DataCell(Text("Приходить")),
              ]),
              DataRow(cells: [
                DataCell(Text("Хунеду")),
                DataCell(Text("Бежать")),
              ]),
              DataRow(cells: [
                DataCell(Text("Къорагlеду")),
                DataCell(Text("Быть необходимым/Быть желаемым/Нуждаться в")),
              ]),
            ],
          ),
          const Divider(),
          ElevatedButton(
              onPressed: context.goToWordBook,
              child: const Text("Словарь слов")),
        ]));
  }
}
