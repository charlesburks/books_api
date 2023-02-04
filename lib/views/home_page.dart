import 'package:books_api/helpers/enums.dart';
import 'package:books_api/helpers/key_util.dart' as keys;
import 'package:books_api/providers/search_provider.dart';
import 'package:books_api/views/detail_page.dart';
import 'package:books_api/views/search_bar.dart';
import 'package:books_api/views/search_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchProvider provider = context.watch<SearchProvider>();
    return Scaffold(
        floatingActionButton: SearchBar(
          onSubmitted: provider.fetchModels,
        ),
        appBar: AppBar(
          title: const Text('Book Search'),
        ),
        body: provider.state == ContnetState.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SearchList(
                key: const Key(keys.searchList),
                booksModel: provider.booksModel,
                onSelected: (book) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(bookModel: book)),
                    )));
  }
}
