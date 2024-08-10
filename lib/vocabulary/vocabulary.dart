class Word {
  final String origin;
  final String translation;
  final String picture;

  const Word(this.origin, this.translation, this.picture);
}

class Chapter {
  final String name;
  final String cover;
  final List<Word> words;

  const Chapter(this.name, this.words, this.cover);
}

const imgNotSetYet = "https://cdn-icons-png.freepik.com/256/720/720315.png";

class Vocabulary {
  final List<Chapter> chapters = List.of([
    Chapter(
        "Счёт",
        List.of([
          Word("Цеб", "Один",
              imgNotSetYet),
          Word("Кlекlи", "Два",
              imgNotSetYet),
        ]),
        imgNotSetYet
    ),
    Chapter(
      "Сезоны года",
      List.of([
        Word("...", "Осень",
            imgNotSetYet),
        Word("Регlи", "Лето",
            imgNotSetYet),
        Word("Гlелиб", "Весна",
            imgNotSetYet),
        Word("Цебир", "Зима",
            imgNotSetYet),
      ]),
        imgNotSetYet
    ),
    Chapter(
        "Семья",
        List.of([
          Word("Ила", "Мама",
              "https://cdn-icons-png.freepik.com/256/4478/4478085.png"),
          Word("Илабаба", "Бабушка",
              "https://cdn-icons-png.freepik.com/256/1155/1155223.png"),
        ]),
        imgNotSetYet
    ),
    Chapter(
      "Эмоции",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Тело",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Одежда",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Аксессуары",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Дом/Жилье",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Природа(море, озеро, пляж, ",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Погода",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Кухня",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Огород",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Животные",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Еда",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Фрукты",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Овощи",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Школа",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Спорт",
      List.empty(),imgNotSetYet
    ),
    Chapter(
      "Музыка",
      List.empty(),imgNotSetYet
    ),
  ]);

  Chapter chapter(String chapterName) {
    return chapters.firstWhere((chapter) => chapter.name == chapterName);
  }

  List<String> chaptersNames() {
    return chapters.map((el) => el.name).toList(growable: false);
  }
}
