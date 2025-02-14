import 'package:universalapp/models/bible_book.dart';

abstract class BibleState {}

class BibleInitial extends BibleState {}

class BibleBooksLoading extends BibleState {}

class BibleBooksLoaded extends BibleState {
  final List<BibleBook> books;
  final String? selectedBook;

  BibleBooksLoaded(this.books, {this.selectedBook});
}

class BibleBooksError extends BibleState {
  final String message;

  BibleBooksError(this.message);
} 