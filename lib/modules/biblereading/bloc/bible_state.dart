import 'package:universalapp/modules/biblereading/models/bible_book.dart';
import 'package:universalapp/modules/biblereading/models/chapter.dart';

abstract class BibleState {}

class BibleInitial extends BibleState {}

class BibleBooksLoading extends BibleState {}

class BibleBooksLoaded extends BibleState {
  final List<BibleBook> books;
  final BibleBook? selectedBook;
  final int? selectedChapter;
  final Chapter? chapter;
  final int? chapterCount;

  BibleBooksLoaded(
    this.books, {
    this.selectedBook,
    this.selectedChapter,
    this.chapter,
    this.chapterCount,
  });

  BibleBooksLoaded copyWith({
    List<BibleBook>? books,
    BibleBook? selectedBook,
    int? selectedChapter,
    Chapter? chapter,
    int? chapterCount,
  }) {
    return BibleBooksLoaded(
      books ?? this.books,
      selectedBook: selectedBook ?? this.selectedBook,
      selectedChapter: selectedChapter ?? this.selectedChapter,
      chapter: chapter ?? this.chapter,
      chapterCount: chapterCount ?? this.chapterCount,
    );
  }
}

class BibleBooksError extends BibleState {
  final String message;

  BibleBooksError(this.message);
} 