import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/repository/books_repository.dart';
import 'package:ganbooks/views/books_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ganbooks',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: RepositoryProvider(
        create: (context) => BooksRepository(),
        child: const BooksView(),
      ),
    );
  }
}
