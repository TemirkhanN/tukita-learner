import 'package:flutter/material.dart';
import 'package:tukita_learner/screen/chapter.dart';
import 'package:tukita_learner/widget/chapter_template.dart';

class HowtoUseWhere extends StatelessWidget {
  static const ChapterRef reference = ChapterRef("how-to-use-where", 'Вопрос "где"');

  const HowtoUseWhere();

  @override
  Widget build(BuildContext context) {
    return ChapterTemplate(
        reference.description,
        const Text("Здесь мы научимся вопросу \"где\" и как на него отвечать."

/*        Брат, ты где - ваци, мини гьанкlу эгув?
        Сестра, ты где - йаци, мини гьанкlу эгуй?
        Где кошка - кету гьанкlу эгуб?

        Если обобщить, форма для таких вопросов всегда одна и та же - "кто где есть?".

        Кто       Где           Есть
        Дада      гьанкlу       эгув?
        Ила       гьанкlу       эгуй?
        Кету      гьанкlу       эгуб?
        Илълъи    гьанкlу       эгубе?
        Вацибди   гьанкlу       эгубе?
        Гьобе     гьанкlу       эгубе?

        Чтобы ответить на вопрос "где", нам нужно озвучить место. Самые распространенные места - это

        дома - къелълъи
        на работе - тухалалъила
        в школе - ушкуллъила
        в магазине - тукинлъила
        на рынке - базарлъила
        у соседей - мадугьалдилучlи
        у родственников - гlагарлъиричlи
        в огороде - гьурини

// TODO упражнение для проверки именно местоположения. С вариантами ответов и можно без для более высокого уровня сложности"
 */
            ));
  }
}
