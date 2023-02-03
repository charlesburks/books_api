// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:books_api/models/books_model.dart';
import 'package:books_api/helpers/request_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

Future<String> loadAsset(String value) async {
  return await rootBundle.loadString(value);
}

@GenerateMocks([http.Client])
void main() {
  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());
  test('request_provider_test', () {
    RequestUtil provider = RequestUtil();
    const initialString = ' My Example Here ';
    var request = provider.buildRequest(initialString);
    expect(request.query, 'q=my%2Bexample%2Bhere');
    expect(request.host, 'openlibrary.org');
    expect(request.path, '/search.json');
  });

  test('books_model_build', () async {
    const mockLocation = 'assets/mocks/books_mock.json';
    final mockJson = await loadAsset(mockLocation);
    BooksModel model = BooksModel.fromJson(jsonDecode(mockJson));
    expect(model.docs.length, 2);
  });

  test('books_mock_build', () async {
    RequestUtil provider = RequestUtil();
    provider.client = MockClient((request) async {
      const mockLocation = 'assets/mocks/books_mock.json';
      String mockJson = await loadAsset(mockLocation);
      return Response(mockJson, 200, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
    });
    final books = await provider.fetchBookData('example');
    expect(books?.docs.length, 2);
  });
}
