//create model with freezed

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String id;
  final String name;
  String? image;
  final String? color;

  CategoryModel({
    required this.id,
    required this.name,
    this.image,
    this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

//command for flutter pub run build_runner build --delete-conflicting-outputs