import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/lesson.dart';
import 'package:tukita_learner/vocabulary/vocabulary.dart';
import 'package:tukita_learner/widget/lesson_navigation.dart';
import 'package:tukita_learner/widget/lesson_template.dart';
import 'package:tukita_learner/widget/test.dart';

class Pronouns extends StatelessWidget {
  static const String name = "Урок 3: местоимения";

  final List<Word> _dictionary = const [
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

  const Pronouns();

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(
      name,
      Column(children: [
        const Text(
            "Здесь я должен дать оговорку: не нужно пытаться выучить всё и сразу - это малоэффективно и только утомит вас. Просто держите поблизости, как шпаргалку."
            "Для начала следует ограничиться местоимениями я, ты, он, она, оно из первых двух столбцов, а к остальным переходить позже, по мере необходимости."),
        DataTable(
          columns: const [
            DataColumn(
                label: Text("Кто"),
                headingRowAlignment: MainAxisAlignment.center),
            DataColumn(
                label: Text("Кем"),
                headingRowAlignment: MainAxisAlignment.center),
            DataColumn(
                label: Text("Кому"),
                headingRowAlignment: MainAxisAlignment.center),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text("я - дини")),
              DataCell(Text("мной - динди")),
              DataCell(Text("мне - дилъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("ты - мини")),
              DataCell(Text("тобой - минди")),
              DataCell(Text("тебе - дулъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("он - гьов")),
              DataCell(Text("им - гьошуд")),
              DataCell(Text("ему - гьошулъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("она - гьой")),
              DataCell(Text("ею - гьолъид")),
              DataCell(Text("ей - гьолъилъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("оно - гьоб")),
              DataCell(Text("этим - гьолъид")),
              DataCell(Text("этому - гьолъилъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("мы - ищи/илълъи")),
              DataCell(Text("нами - ищид/илълъид")),
              DataCell(Text("нам - ищилъа/илълъилъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("вы - бишти")),
              DataCell(Text("вами - биштид")),
              DataCell(Text("вам - биштилъа")),
            ]),
            DataRow(cells: [
              DataCell(Text("они - гьобе")),
              DataCell(Text("ими - гьордуд")),
              DataCell(Text("им - гьордулъа")),
            ]),
          ],
        ),
        const Divider(),
        const Text("Дополнительные местоимения"),
        DataTable(
          columns: const [
            DataColumn(
                label: Text("к кому"),
                headingRowAlignment: MainAxisAlignment.center),
            DataColumn(
                label: Text("у кого"),
                headingRowAlignment: MainAxisAlignment.center),
            DataColumn(
                label: Text("?"),
                headingRowAlignment: MainAxisAlignment.center),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text("ко мне - дигьар")),
              DataCell(Text("у меня - дичlи")),
              DataCell(Text("? - диба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к тебе - дугьар")),
              DataCell(Text("у тебя - дучlи")),
              DataCell(Text("? - дуба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к нему - гьошугьар")),
              DataCell(Text("у него - гьошучlи")),
              DataCell(Text("? - гьошуба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к ней - гьолъигьар")),
              DataCell(Text("у нее - гьолъичlи")),
              DataCell(Text("? - гьолъиба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к этому - гьолъигьар")),
              DataCell(Text("у этого - гьолъичlи")),
              DataCell(Text("? - гьолъиба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к нам - ищигьар/илълъигьар")),
              DataCell(Text("у нас - ищичlи/илълъичlи")),
              DataCell(Text("? - ищиба/илълъиба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к вам - биштигьар")),
              DataCell(Text("у вас - биштичlи")),
              DataCell(Text("? - биштиба")),
            ]),
            DataRow(cells: [
              DataCell(Text("к ним - гьордугьар")),
              DataCell(Text("у них - гьордучlи")),
              DataCell(Text("? - гьордуба")),
            ]),
          ],
        ),
        StartTestButton.translation(_dictionary),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LessonNavigationButton(LessonName.questionWords),
            LessonNavigationButton(LessonName.basicSentences),
          ],
        ),
      ]),
    );
  }
}
