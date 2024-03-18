import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ganbooks/models/book.dart';
import 'package:ganbooks/models/book_detail.dart';

class BooksRepository {
  BooksRepository(this._dio);
  final Dio _dio;

  Future<List<Book>> fetchNewBooks() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('new');
      final books = <Book>[];
      final booksResponse =
          response.data?['books'] as List<Map<String, dynamic>>;
      for (final json in booksResponse) {
        books.add(Book.fromJson(json));
      }
      return books;
    } on DioException {
      log('Error fetching new books');
      return [];
    }
  }

  Future<List<Book>> searchBooks(String query) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('search/$query');
      final books = <Book>[];
      final booksResponse =
          response.data?['books'] as List<Map<String, dynamic>>;
      for (final json in booksResponse) {
        books.add(Book.fromJson(json));
      }
      return books;
    } on DioException {
      log('Error fetching books');
      return [];
    }
  }

  Future<BookDetail> getBookDetails(String isbn) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('books/$isbn');
      return BookDetail.fromJson(response.data ?? {});
    } on DioException {
      log('Error fetching book details');
      rethrow;
    }
  }
}
