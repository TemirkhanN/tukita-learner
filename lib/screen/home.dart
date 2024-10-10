import 'package:flutter/material.dart';
import 'package:tukita_learner/router.dart';
import 'package:tukita_learner/screen/chapter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Изучение тукитинского языка"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double maxWidth = 500.0;

        return Center(
            child: SingleChildScrollView(
                child: Container(
          width: constraints.maxWidth > maxWidth ? maxWidth : constraints.maxWidth,
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            const Text(
              "Это краш-курс тукитинского языка. Наша задача максимально быстро научить вас понимать тукитинский и, по-возможности, говорить на нем."
              "Данный материал не подходит филологам - систематизация, которую мы будем использовать, не совпадает с общепринятой практикой."
              "Прежде чем мы начнем, я хочу отметить, что даже если вы будете путать все существующие правила и говорить максимально косноязычно, ничего страшного."
              "В нашем языке нет строгого порядка слов и его первобытная простота позволяют понимать вас даже если вы говорите неправильно."
              "Не переживайте, чуть чаще практикуйтесь со своими родными, и всё придет само собой. Удачи!\n",
              softWrap: true,
            ),
            ListTile(onTap: context.openWordbook, title: const Text("Словарь")),
            ...TableOfContents.list().map((ch) => ListTile(title: Text(ch.description), onTap: () => context.openChapter(ch))),
          ]),
        )));
      }),
    );
  }
}
