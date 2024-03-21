part of 'books_cubit.dart';

class BooksState extends Equatable {
  const BooksState({
    this.books = const [],
    this.newBooks = const [],
    this.loading = false,
  });
  final List<Book> books;
  final List<Book> newBooks;
  final bool loading;

  BooksState copyWith({
    List<Book>? books,
    List<Book>? newBooks,
    bool? loading,
  }) {
    return BooksState(
      books: books ?? this.books,
      loading: loading ?? this.loading,
      newBooks: newBooks ?? this.newBooks,
    );
  }

  @override
  List<Object> get props => [
        books,
        loading,
        newBooks,
      ];
}
