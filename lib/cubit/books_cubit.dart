import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/models/book.dart';
import 'package:ganbooks/repository/books_repository.dart';
import 'package:ganbooks/utils/debounce.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(
    this._repository,
  ) : super(const BooksState());

  final BooksRepository _repository;
  final _debounce = Debounce(milliseconds: 500);

  Future<void> fetchNewBooks() async {
    emit(state.copyWith(loading: true));
    final books = await _repository.fetchNewBooks();
    emit(state.copyWith(books: books, loading: false, newBooks: books));
  }

  Future<void> searchBooks(String query) async {
    emit(state.copyWith(loading: true));
    final queryTrim = query.trim();
    if (queryTrim.isEmpty || queryTrim.length < 3) {
      emit(state.copyWith(books: state.newBooks, loading: false));
    } else {
      _debounce.run(() async {
        final books = await _repository.searchBooks(query);
        emit(state.copyWith(books: books, loading: false));
      });
    }
  }
}
