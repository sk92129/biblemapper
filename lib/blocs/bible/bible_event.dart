abstract class BibleEvent {}

class LoadBibleBooks extends BibleEvent {}

class SearchBibleBooks extends BibleEvent {
  final String query;

  SearchBibleBooks(this.query);
} 