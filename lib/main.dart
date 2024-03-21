import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/repository/auth_repository.dart';
import 'package:ganbooks/repository/books_repository.dart';
import 'package:ganbooks/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      prefs: prefs,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.prefs,
    super.key,
  });

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BooksRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(prefs),
        ),
      ],
      child: MaterialApp(
        title: 'Ganbooks',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: const LoginView(),
      ),
    );
  }
}
