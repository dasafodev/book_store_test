part of 'book_detail_cubit.dart';

class BookDetailState extends Equatable {
  const BookDetailState({
    this.book,
    this.loading = false,
  });
  final bool loading;
  final BookDetail? book;

  List<int> get allStars =>
      List.generate(5, (index) => index < (book?.rating ?? 0) ? 1 : 0);

  BookDetailState copyWith({
    BookDetail? book,
    bool? loading,
  }) {
    return BookDetailState(
      book: book ?? this.book,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        book,
        loading,
      ];
}
