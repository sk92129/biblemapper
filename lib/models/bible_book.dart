class BibleBook {
  final int id;
  final String name;
  final String testament;
  final Genre genre;

  const BibleBook({
    required this.id,
    required this.name,
    required this.testament,
    required this.genre,
  });

  factory BibleBook.fromJson(Map<String, dynamic> json) {
    return BibleBook(
      id: json['id'] as int,
      name: json['name'] as String,
      testament: json['testament'] as String,
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );
  }
}

class Genre {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
} 