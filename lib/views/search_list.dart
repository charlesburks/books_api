import 'package:books_api/models/book_model.dart';
import 'package:books_api/models/books_model.dart';
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
          final title = model.title;
          final author = model.author_name.first;
          final year = model.first_publish_year;
          return InkWell(
            onTap: () => onSelected(model),
            child: ListTile(
              title: Text('Title: $title'),
              subtitle: Text('Author: $author\nYear Published: $year'),
              isThreeLine: true,
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        }),
        separatorBuilder: ((context, index) => Container(
              color: Colors.grey[200],
              height: 5,
            )),
        itemCount: booksModel?.num_found.toInt() ?? 0);
  }
}
