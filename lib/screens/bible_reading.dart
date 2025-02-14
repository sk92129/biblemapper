import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bible/bible_bloc.dart';
import '../blocs/bible/bible_event.dart';
import '../blocs/bible/bible_state.dart';
import '../repositories/bible_repository.dart';

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
                // Book selector with BLoC
                BlocBuilder<BibleBloc, BibleState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: PopupMenuButton(
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
                                    'ESV',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                            onSelected: (book) {
                              // TODO: Handle book selection
                            },
                            itemBuilder: (context) {
                              if (state is BibleBooksLoaded) {
                                return state.books.map((book) {
                                  return PopupMenuItem(
                                    value: book,
                                    child: Text(book.name),
                                  );
                                }).toList();
                              }
                              return [];
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.format_size),
                          onPressed: () {
                            // TODO: Implement font size adjustment
                          },
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