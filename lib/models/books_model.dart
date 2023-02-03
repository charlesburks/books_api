import 'package:books_api/models/book_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel {
  List<BookModel> docs;
  num num_found;
  String q;
  BooksModel(this.docs, this.num_found, this.q);

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);
}
