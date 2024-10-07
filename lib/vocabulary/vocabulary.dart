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
  const Vocabulary();

  final List<Chapter> chapters = const [
    Chapter(
      "Счёт",
      [
        Word("Цеб", "Один", imgNotSetYet),
        Word("Кlекlи", "Два", imgNotSetYet),
      ],
      imgNotSetYet,
    ),
    Chapter(
        "Сезоны года",
        [
          Word("...", "Осень", imgNotSetYet),
          Word("Регlи", "Лето", imgNotSetYet),
          Word("Гlелиб", "Весна", imgNotSetYet),
          Word("Цебир", "Зима", imgNotSetYet),
        ],
        imgNotSetYet),
    Chapter(
        "Семья",
        [
          Word("Ила", "Мама",
              "https://cdn-icons-png.freepik.com/256/4478/4478085.png"),
          Word("Илабаба", "Бабушка",
              "https://cdn-icons-png.freepik.com/256/1155/1155223.png"),
        ],
        imgNotSetYet),
    Chapter("Эмоции", [], imgNotSetYet),
    Chapter("Тело", [], imgNotSetYet),
    Chapter("Одежда", [], imgNotSetYet),
    Chapter("Аксессуары", [], imgNotSetYet),
    Chapter("Дом/Жилье", [], imgNotSetYet),
    Chapter("Природа(море, озеро, пляж, ", [], imgNotSetYet),
    Chapter("Погода", [], imgNotSetYet),
    Chapter("Кухня", [], imgNotSetYet),
    Chapter("Огород", [], imgNotSetYet),
    Chapter("Животные", [], imgNotSetYet),
    Chapter("Еда", [], imgNotSetYet),
    Chapter("Фрукты", [], imgNotSetYet),
    Chapter("Овощи", [], imgNotSetYet),
    Chapter("Школа", [], imgNotSetYet),
    Chapter("Спорт", [], imgNotSetYet),
    Chapter("Музыка", [], imgNotSetYet),
  ];

  Chapter chapter(String chapterName) {
    return chapters.firstWhere((chapter) => chapter.name == chapterName);
  }

  List<String> chaptersNames() {
    return chapters.map((el) => el.name).toList(growable: false);
  }
}
