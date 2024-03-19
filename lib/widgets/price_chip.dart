import 'package:flutter/material.dart';

class PriceChip extends StatelessWidget {
  const PriceChip({
    required this.price,
    super.key,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF3F3F3F),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.book,
              color: Colors.green.shade300,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
