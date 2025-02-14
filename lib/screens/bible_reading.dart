import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bible/bible_bloc.dart';
import '../blocs/bible/bible_event.dart';
import '../blocs/bible/bible_state.dart';
import '../repositories/bible_repository.dart';
import '../models/bible_book.dart';

class BibleReadingScreen extends StatelessWidget {
  const BibleReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BibleBloc(BibleRepository())..add(LoadBibleBooks()),
      child: const BibleReadingView(),
    );
  }
}

class BibleReadingView extends StatelessWidget {
  const BibleReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('John 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              // TODO: Implement bookmark functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<BibleBloc, BibleState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: PopupMenuButton<BibleBook>(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      if (state is BibleBooksLoading)
                                        const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      else
                                        const Text(
                                          'Select Book',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      const Spacer(),
                                      const Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                                onSelected: (book) {
                                  // TODO: Handle book selection
                                },
                                itemBuilder: (context) {
                                  if (state is BibleBooksLoaded) {
                                    return state.books.map((book) {
                                      return PopupMenuItem(
                                        value: book,
                                        child: Row(
                                          children: [
                                            Text(book.name),
                                            const Spacer(),
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: book.testament == 'OT'
                                                    ? Colors.blue[100]
                                                    : Colors.green[100],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                book.testament,
                                                style: TextStyle(
                                                  color: book.testament == 'OT'
                                                      ? Colors.blue[900]
                                                      : Colors.green[900],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList();
                                  }
                                  return [];
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.format_size),
                              onPressed: () {
                                // TODO: Implement font size adjustment
                              },
                            ),
                          ],
                        ),
                        if (state is BibleBooksError)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              state.message,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Verse number and content
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.8,
                    ),
                    children: [
                      TextSpan(
                        text: '1 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'In the beginning was the Word, and the Word was with God, and the Word was God. ',
                      ),
                      TextSpan(
                        text: '2 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'He was in the beginning with God. ',
                      ),
                      TextSpan(
                        text: '3 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'All things were made through him, and without him was not any thing made that was made. ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 