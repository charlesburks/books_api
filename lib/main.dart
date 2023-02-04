import 'package:books_api/helpers/key_util.dart' as keys;
import 'package:books_api/providers/search_provider.dart';
import 'package:books_api/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      key: const Key(keys.mainKey),
      home: ChangeNotifierProvider(
        create: (context) => SearchProvider(),
        child: const HomePage(),
      ),
    ),
  );
}
