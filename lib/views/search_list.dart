import 'package:books_api/models/book_model.dart';
import 'package:books_api/models/books_model.dart';
import 'package:books_api/views/search_tile.dart';
import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final BooksModel? booksModel;
  final Function(BookModel) onSelected;
  const SearchList({super.key, this.booksModel, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    if (booksModel == null || (booksModel?.docs.isEmpty ?? true)) {
      return const Center(child: Text('No Results'));
    }
    return ListView.separated(
        itemBuilder: ((context, index) {
          BookModel model = booksModel!.docs[index];
          return SearchTile(
              bookModel: model, onSelected: () => onSelected(model));
        }),
        separatorBuilder: ((context, index) => Container(
              color: Colors.grey[200],
              height: 5,
            )),
        itemCount: booksModel?.num_found.toInt() ?? 0);
  }
}
