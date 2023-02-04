// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksModel _$BooksModelFromJson(Map<String, dynamic> json) => BooksModel(
      (json['docs'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['num_found'] as num,
      json['q'] as String,
    );
