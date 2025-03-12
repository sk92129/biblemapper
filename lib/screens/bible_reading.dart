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
        child: Scrollbar(
          thumbVisibility: true, // Always show the scrollbar
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
                                  // ... existing book selector code ...
                                  onSelected: (book) {
                                    context.read<BibleBloc>().add(SelectBook(book));
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
                  // Make this section scrollable
                  SingleChildScrollView(
                    child: Column(
                      children: [
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 