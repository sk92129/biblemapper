class Chapter {
  final int number;
  final List<Verse> verses;

  Chapter({
    required this.number,
    required this.verses,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      number: json['chapter'] as int,
      verses: (json['verses'] as List)
          .map((verse) => Verse.fromJson(verse))
          .toList(),
    );
  }
}

class Verse {
  final int number;
  final String text;

  Verse({
    required this.number,
    required this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      number: json['verse'] as int,
      text: json['text'] as String,
    );
  }
} 