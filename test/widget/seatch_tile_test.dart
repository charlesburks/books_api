import 'dart:convert';

import 'package:books_api/models/book_model.dart';
import 'package:books_api/views/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_util.dart' as util;

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  testWidgets('search_tile_test', (tester) async {
    final mockJson = await util.loadAsset(util.bookMockLocation);
    BookModel bookModel = BookModel.fromJson(jsonDecode(mockJson));
    await tester.pumpWidget(MaterialApp(
      home: Card(
        child: SearchTile(
          bookModel: bookModel,
          onSelected: () => print(''),
        ),
      ),
    ));
    await expectLater(find.byType(SearchTile),
        matchesGoldenFile('goldens/search_tile_happy_state.png'));
  });
}
