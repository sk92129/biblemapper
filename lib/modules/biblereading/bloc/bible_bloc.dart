import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_event.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_state.dart';
import '../repository/bible_repository.dart';


class BibleBloc extends Bloc<BibleEvent, BibleState> {
  final BibleRepository _repository;

  BibleBloc(this._repository) : super(BibleInitial()) {
    on<LoadBibleBooks>(_onLoadBibleBooks);
    on<SearchBibleBooks>(_onSearchBibleBooks);
    on<SelectBook>(_onSelectBook);
    on<SelectChapter>(_onSelectChapter);
  }

  Future<void> _onLoadBibleBooks(
    LoadBibleBooks event,
    Emitter<BibleState> emit,
  ) async {
    emit(BibleBooksLoading());
    try {
      final books = await _repository.getBooks();
      emit(BibleBooksLoaded(books));
    } catch (e) {
      emit(BibleBooksError(e.toString()));
    }
  }

  Future<void> _onSearchBibleBooks(
    SearchBibleBooks event,
    Emitter<BibleState> emit,
  ) async {
    try {
      final books = await _repository.searchBooks(event.query);
      emit(BibleBooksLoaded(books));
    } catch (e) {
      emit(BibleBooksError(e.toString()));
    }
  }

  Future<void> _onSelectBook(
    SelectBook event,
    Emitter<BibleState> emit,
  ) async {
    if (state is BibleBooksLoaded) {
      final currentState = state as BibleBooksLoaded;
      try {
        final chapterCount = await _repository.getChapterCount(event.book.id);
        emit(currentState.copyWith(
          selectedBook: event.book,
          selectedChapter: 1,
          chapterCount: chapterCount,
        ));
        add(SelectChapter(1)); // Load first chapter by default
      } catch (e) {
        emit(BibleBooksError(e.toString()));
      }
    }
  }

  Future<void> _onSelectChapter(
    SelectChapter event,
    Emitter<BibleState> emit,
  ) async {
    if (state is BibleBooksLoaded) {
      final currentState = state as BibleBooksLoaded;
      if (currentState.selectedBook != null) {
        try {
          final chapter = await _repository.getChapter(
            currentState.selectedBook!.id,
            event.chapter,
          );

          emit(currentState.copyWith(
            selectedChapter: event.chapter,
            chapter: chapter,
          ));
        } catch (e) {
          emit(BibleBooksError(e.toString()));
        }
      }
    }
  }
} 