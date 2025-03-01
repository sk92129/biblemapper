import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_bloc.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_event.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_state.dart';

import '../repository/bible_repository.dart';
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
        title: const Text('Bible Reading'),
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
                                      else if (state is BibleBooksLoaded && state.selectedBook != null)
                                        Text(
                                          state.selectedBook!.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
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
                                  context.read<BibleBloc>().add(SelectBook(book));
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

                            
                            if (state is BibleBooksLoaded &&
                                state.selectedBook != null &&
                                state.chapterCount != null)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: PopupMenuButton<int>(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Chapter ${state.selectedChapter ?? 1}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                  onSelected: (chapter) {
                                    context.read<BibleBloc>().add(SelectChapter(chapter));
                                  },
                                  itemBuilder: (context) {
                                    return List.generate(
                                      state.chapterCount!,
                                      (index) => PopupMenuItem(
                                        value: index + 1,
                                        child: Text('Chapter ${index + 1}'),
                                      ),
                                    );
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
                          Container(
                            padding: const EdgeInsets.only(top: 8),
                            child:  Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: 
                            Column(
                            children: [
                              const Text(
                                'Error loading Bible books - likely CORS issue',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.message,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),


                          ),
                          ),
                         


                          const SizedBox(height: 16),
                          if (state is BibleBooksLoaded && state.chapter != null)
                            Column(
                              children: state.chapter!.verses.map((verse) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        height: 1.8,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '${verse.number} ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(text: '${verse.text} '),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                      ],
                    );
                  },


                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
} 