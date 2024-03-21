import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/models/book_detail.dart';
import 'package:ganbooks/repository/books_repository.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  BookDetailCubit(
    this._repository,
  ) : super(const BookDetailState());

  final BooksRepository _repository;

  Future<void> fetchBookDetail(String id) async {
    emit(state.copyWith(loading: true));
    final book = await _repository.getBookDetails(id);
    emit(state.copyWith(book: book, loading: false));
  }
}
