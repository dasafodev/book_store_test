import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.itbook.store/1.0/',
    connectTimeout: const Duration(seconds: 3),
  ),
);
