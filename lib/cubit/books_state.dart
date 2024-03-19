part of 'books_cubit.dart';

class BooksState extends Equatable {
  const BooksState({
    this.books = const [],
    this.loading = false,
  });
  final List<Book> books;
  final bool loading;

  BooksState copyWith({
    List<Book>? books,
    bool? loading,
  }) {
    return BooksState(
      books: books ?? this.books,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [
        books,
        loading,
      ];
}
