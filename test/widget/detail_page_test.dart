import 'dart:convert';

import 'package:books_api/models/book_model.dart';
import 'package:books_api/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_util.dart' as util;

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  testWidgets('detials_test', (tester) async {
    final mockJson = await util.loadAsset(util.bookMockLocation);
    BookModel bookModel = BookModel.fromJson(jsonDecode(mockJson));
    await tester.pumpWidget(MaterialApp(
      home: DetailPage(
        bookModel: bookModel,
      ),
    ));
    await expectLater(find.byType(DetailPage),
        matchesGoldenFile('goldens/detail_page_happy_state.png'));
  });
}
