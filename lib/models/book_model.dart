import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  String key;
  String title;
  num? first_publish_year;
  num? number_of_pages_median;
  List<String>? id_wikidata;
  List<String>? id_amazon;
  List<String> author_name;

  BookModel(
    this.key,
    this.title,
    this.first_publish_year,
    this.number_of_pages_median,
    this.author_name,
    this.id_amazon,
    this.id_wikidata,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
