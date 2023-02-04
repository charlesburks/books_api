import 'package:books_api/models/book_model.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final BookModel bookModel;
  final VoidCallback onSelected;
  const SearchTile(
      {super.key, required this.bookModel, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final title = bookModel.title;
    final author = bookModel.author_name.first;
    final year = bookModel.first_publish_year;
    return InkWell(
      onTap: onSelected,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text('Title: $title'),
          subtitle: Text('Author: $author\nYear Published: $year'),
          isThreeLine: true,
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
