import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/bible_repository.dart';
import 'bible_event.dart';
import 'bible_state.dart';

class BibleBloc extends Bloc<BibleEvent, BibleState> {
  final BibleRepository _repository;

  BibleBloc(this._repository) : super(BibleInitial()) {
    on<LoadBibleBooks>(_onLoadBibleBooks);
    on<SearchBibleBooks>(_onSearchBibleBooks);
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
} 