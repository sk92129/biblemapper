import 'package:universalapp/models/bible_book.dart';

abstract class BibleEvent {}

class LoadBibleBooks extends BibleEvent {}

class SearchBibleBooks extends BibleEvent {
  final String query;

  SearchBibleBooks(this.query);
}

class SelectBook extends BibleEvent {
  final BibleBook book;
  SelectBook(this.book);
}

class SelectChapter extends BibleEvent {
  final int chapter;
  SelectChapter(this.chapter);
} 