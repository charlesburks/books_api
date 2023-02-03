import 'dart:convert';

import 'package:books_api/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider extends ChangeNotifier {
  final _requestUrl = 'openlibrary.org';
  var client = http.Client();

  Uri buildRequest(String? value) {
    final cleanedString =
        value?.trim().replaceAll(' ', '+').toLowerCase() ?? '';
    Map<String, dynamic> params = {'q': cleanedString};
    return Uri.https(_requestUrl, 'search.json', params);
  }

  Future<BooksModel?> fetchBookData(String? value) async {
    try {
      final request = buildRequest(value);
      final response = await client.get(request);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final json = jsonDecode(response.body);
        return BooksModel.fromJson(json);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
