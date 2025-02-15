class Chapter {
  final List<Verse> verses;
  final int chapter;

  Chapter({
    required this.chapter,
    required this.verses,
  });

  factory Chapter.fromJson(List<dynamic> json, int chapterId) {
    return Chapter(
      chapter: chapterId,
      verses: json.map((verse) => Verse.fromJson(verse)).toList(),
    );
  }
}

class Verse {
  final int number;
  final String text;
  final int chapter;

  Verse({
    required this.chapter,
    required this.number,
    required this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      chapter: json['chapterId'] as int,
      number: json['verseId'] as int,
      text: json['verse'] as String,
    );
  }
} 