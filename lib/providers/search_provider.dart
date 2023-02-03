import 'package:books_api/helpers/enums.dart';
import 'package:books_api/helpers/request_util.dart';
import 'package:books_api/models/books_model.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  ContnetState _state = ContnetState.loaded;
  ContnetState get state => _state;
  BooksModel? _booksModel;
  BooksModel? get booksModel => _booksModel;
  RequestUtil _util = RequestUtil();

  void _clearSearch() {
    _booksModel = null;
    notifyListeners();
  }

  Future<void> fetchModels(String searchValue) async {
    _clearSearch();
    _state = ContnetState.loading;
    notifyListeners();
    final response = await _util.fetchBookData(searchValue);
    if (response != null) {
      _booksModel = response;
    }
    _state = ContnetState.loaded;
    notifyListeners();
  }
}
