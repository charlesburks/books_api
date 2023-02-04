import 'dart:convert';

import 'package:books_api/main.dart';
import 'package:books_api/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  testWidgets('home_page_test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => SearchProvider(),
          child: const HomePage(),
        ),
      ),
    );
    await expectLater(find.byType(HomePage),
        matchesGoldenFile('goldens/home_page_empty_state.png'));
  });
}
