import 'dart:convert';

import 'package:ganbooks/models/book.dart';

class BookDetail extends Book {
  const BookDetail({
    required super.title,
    required this.error,
    required super.subtitle,
    required this.authors,
    required this.publisher,
    required this.isbn10,
    required super.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required super.price,
    required super.image,
    required super.url,
  });

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
        error: json['error'].toString(),
        title: json['title'].toString(),
        subtitle: json['subtitle'].toString(),
        authors: json['authors'].toString(),
        publisher: json['publisher'].toString(),
        isbn10: json['isbn10'].toString(),
        isbn13: json['isbn13'].toString(),
        pages: json['pages'].toString(),
        year: json['year'].toString(),
        rating: int.tryParse(json['rating'].toString()) ?? 0,
        desc: utf8.decode(json['desc'].toString().codeUnits),
        price: json['price'].toString(),
        image: json['image'].toString(),
        url: json['url'].toString(),
      );
  final String error;
  final String authors;
  final String publisher;
  final String isbn10;
  final String pages;
  final String year;
  final int rating;
  final String desc;

  // List<int> get allStars => List.generate(5, (index) => index < rating ? 1 : 0);

  @override
  Map<String, dynamic> toJson() => {
        'error': error,
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'pages': pages,
        'year': year,
        'rating': rating,
        'desc': desc,
        'price': price,
        'image': image,
        'url': url,
      };

  @override
  List<Object?> get props => [
        error,
        title,
        subtitle,
        authors,
        publisher,
        isbn10,
        isbn13,
        pages,
        year,
        rating,
        desc,
        price,
        image,
        url,
      ];
}
