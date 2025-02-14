import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universalapp/models/bible_book.dart';

class BibleRepository {
  static const String _baseUrl = 'https://bible-go-api.rkeplin.com/v1';

  Future<List<BibleBook>> getBooks() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/books'));
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => BibleBook.fromJson(json)).toList();
      } else {
        print(response);
        throw Exception('Failed to load bible books');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<List<BibleBook>> searchBooks(String query) async {
    final books = await getBooks();
    return books
        .where((book) =>
            book.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
} 