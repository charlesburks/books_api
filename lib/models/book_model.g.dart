// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      json['key'] as String,
      json['title'] as String,
      json['first_publish_year'] as num?,
      json['number_of_pages_median'] as num?,
      (json['author_name'] as List<dynamic>).map((e) => e as String).toList(),
      (json['id_amazon'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['id_wikidata'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'first_publish_year': instance.first_publish_year,
      'number_of_pages_median': instance.number_of_pages_median,
      'id_wikidata': instance.id_wikidata,
      'id_amazon': instance.id_amazon,
      'author_name': instance.author_name,
    };
