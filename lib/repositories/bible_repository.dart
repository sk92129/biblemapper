import 'package:universalapp/models/bible_book.dart';

class BibleRepository {
  // Simulated data - in a real app, this would come from an API or database
  final List<BibleBook> _books = [
    BibleBook(name: 'Genesis', chapters: 50, testament: 'Old'),
    BibleBook(name: 'Exodus', chapters: 40, testament: 'Old'),
    BibleBook(name: 'John', chapters: 21, testament: 'New'),
    BibleBook(name: 'Matthew', chapters: 28, testament: 'New'),
    BibleBook(name: 'Mark', chapters: 16, testament: 'New'),
    BibleBook(name: 'Luke', chapters: 24, testament: 'New'),
    // Add more books as needed
  ];

  Future<List<BibleBook>> getBooks() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _books;
  }

  Future<List<BibleBook>> searchBooks(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _books
        .where((book) =>
            book.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
} 