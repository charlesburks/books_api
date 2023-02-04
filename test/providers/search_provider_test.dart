import 'package:books_api/helpers/enums.dart';
import 'package:books_api/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());
  test('request_provider_test', () async {
    SearchProvider provider = SearchProvider();
    expect(provider.state, ContnetState.loaded);
    expect(provider.booksModel, null);
    await provider.fetchModels('lord of the rings');
    expect(provider.booksModel?.q, 'lord+of+the+rings');
  });
}
