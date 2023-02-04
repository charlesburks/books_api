import 'package:books_api/helpers/key_util.dart' as keys;
import 'package:books_api/models/book_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final BookModel bookModel;
  const DetailPage({super.key, required this.bookModel});

  Widget _getTitleRow(String key, String value) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  key,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                )
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(keys.detialsPage),
      appBar: AppBar(
        title: Text(
          bookModel.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getTitleRow('Author', bookModel.author_name?.first ?? 'NA'),
            _getTitleRow('Year Published',
                bookModel.first_publish_year?.toString() ?? 'NA'),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _getTitleRow('WIKI:', bookModel.id_wikidata![index]);
                },
                itemCount: bookModel.id_wikidata?.length ?? 0),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _getTitleRow('Amazon:', bookModel.id_amazon![index]);
                },
                itemCount: bookModel.id_amazon?.length ?? 0)
          ],
        ),
      ),
    );
  }
}
