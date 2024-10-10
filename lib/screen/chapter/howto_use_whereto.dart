import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/chapter.dart';
import 'package:tukita_learner/widget/chapter_template.dart';

class HowtoUseWhereto extends StatelessWidget {
  static const ChapterRef reference = ChapterRef("how-to-use-where-to", 'Вопросы "куда"');

  const HowtoUseWhereto();

  @override
  Widget build(BuildContext context) {
    return ChapterTemplate(
        reference.description,
        Text("Здесь мы научимся говорить о направлении. С вопросом \"гьанди"
            "(куда) чаще всего используется глагол \"вуалълъа эгу\"(иду сейчас)."
            /*Например, куда идет мальчик - вохьа гьанди вуалълъа эгув?

    Кто       Где          Есть
    Дада      гьанди       вуалълъа эгув?
    Ила       гьанди       йиалълъа эгуй?
    Кету      гьанди       муалълъа эгуб?
    Илълъи    гьанди       муалълъа эгубе?
    Вацибди   гьанди       муалълъа эгубе?
        Гьобе     гьанди       муалълъа эгубе?

// TODO упражнение для проверки именно направления. С вариантами ответов и можно без для более высокого уровня сложности"*/
            ));
  }
}
