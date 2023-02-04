import 'package:flutter/services.dart';

Future<String> loadAsset(String value) async =>
    await rootBundle.loadString(value);

String booksMockLocation = 'assets/mocks/books_mock.json';
String bookMockLocation = 'assets/mocks/book_mock.json';
