import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/cubit/book_detail_cubit.dart';
import 'package:ganbooks/models/book.dart';
import 'package:ganbooks/widgets/price_chip.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksDetail extends StatelessWidget {
  const BooksDetail({
    required this.book,
    super.key,
  });
  final Book book;

  Future<void> _launchUrl(String bookUrl) async {
    if (!await launchUrl(Uri.parse(bookUrl))) {
      throw Exception('Could not launch $bookUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookDetailCubit(
        context.read(),
      )..fetchBookDetail(book.isbn13),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Color(0xFF3F3F3F),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 8,
                        ),
                        child: Hero(
                          tag: book.isbn13,
                          child: Image.network(
                            book.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    child: SafeArea(
                      child: IconButton(
                        iconSize: 32,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<BookDetailCubit, BookDetailState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              book.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          PriceChip(price: book.price),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 24,
                        child: Row(
                          children: state.allStars.map((star) {
                            return Icon(
                              star == 1 ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book.subtitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 32),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: state.loading ? 0 : 1,
                        child: Text(
                          'Description',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: state.loading ? 0 : 1,
                        child: Text(
                          state.book?.desc ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: BlocBuilder<BookDetailCubit, BookDetailState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () => _launchUrl(state.book?.url ?? ''),
              child: const Icon(Icons.add_shopping_cart),
            );
          },
        ),
      ),
    );
  }
}
