import 'dart:convert';

import 'package:books_api/models/books_model.dart';
import 'package:books_api/views/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_util.dart' as util;

void main() {
  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());
  testWidgets('search_list_test', (tester) async {
    String? mockJson;
    await tester.runAsync(() async {
      // this assets loads in a async block.
      mockJson = await util.loadAsset(util.booksMockLocation);
    });

    BooksModel booksModel = BooksModel.fromJson(jsonDecode(mockJson!));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SearchList(
          booksModel: booksModel,
          onSelected: (b) => null,
        ),
      ),
    ));
    Finder tile = find.byKey(Key(booksModel.docs.first.key));
    await tester.press(tile);
    await expectLater(find.byType(SearchList),
        matchesGoldenFile('goldens/search_list_happy_state.png'));
  });
}
