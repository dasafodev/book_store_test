import 'package:flutter/material.dart';
import 'package:ganbooks/models/book.dart';
import 'package:ganbooks/widgets/price_chip.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Image.network(
              book.image,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, _) {
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    PriceChip(price: book.price),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
