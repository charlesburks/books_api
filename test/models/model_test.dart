// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:books_api/models/book_model.dart';
import 'package:books_api/models/books_model.dart';
import 'package:books_api/helpers/request_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import '../test_util.dart' as util;

@GenerateMocks([http.Client])
void main() {
  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());

  test('model_build', () async {
    final mockJson = await util.loadAsset(util.booksMockLocation);
    BooksModel booksModel = BooksModel.fromJson(jsonDecode(mockJson));
    expect(booksModel.docs.length, 2);
    BookModel bookModel = booksModel.docs.first;
    expect(bookModel.id_amazon?.isNotEmpty, true);
    expect(bookModel.id_wikidata?.isNotEmpty, true);
  });

  test('http_mock_build', () async {
    RequestUtil provider = RequestUtil();
    provider.client = MockClient((request) async {
      String mockJson = await util.loadAsset(util.booksMockLocation);
      return Response(mockJson, 200, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
    });
    final books = await provider.fetchBookData('example');
    expect(books?.docs.length, 2);
  });
}
