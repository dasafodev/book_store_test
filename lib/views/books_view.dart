import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/cubit/books_cubit.dart';
import 'package:ganbooks/widgets/book_preview.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(context.read())..fetchNewBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ganbooks'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Search books',
                    filled: true,
                    fillColor: Color(0xFF3F3F3F),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (query) {
                    context.read<BooksCubit>().searchBooks(query);
                  },
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!state.loading && state.books.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.only(right: 16),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return BookPreview(book: book);
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
