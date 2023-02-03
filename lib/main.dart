import 'package:books_api/helpers/enums.dart';
import 'package:books_api/providers/search_provider.dart';
import 'package:books_api/views/search_list.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => SearchProvider(),
        child: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchProvider provider = context.watch<SearchProvider>();
    return Scaffold(
        appBar: EasySearchBar(
            title: const Text('Search Book'),
            onSearch: (value) async => await provider.fetchModels(value)),
        body: provider.state == ContnetState.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SearchList(
                booksModel: provider.booksModel,
                onSelected: (v) => print('selected')));
  }
}
