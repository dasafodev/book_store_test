import 'dart:convert';

import 'package:equatable/equatable.dart';

class Book extends Equatable {
  const Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: utf8.decode(json['title'].toString().codeUnits),
        subtitle: utf8.decode(json['subtitle'].toString().codeUnits),
        isbn13: json['isbn13'].toString(),
        price: json['price'].toString(),
        image: json['image'].toString(),
        url: json['url'].toString(),
      );
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'isbn13': isbn13,
        'price': price,
        'image': image,
        'url': url,
      };

  @override
  List<Object?> get props => [
        title,
        subtitle,
        isbn13,
        price,
        image,
        url,
      ];
}
