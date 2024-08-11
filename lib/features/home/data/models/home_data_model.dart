import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_model.dart';
import 'medical_center_model.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  final List<MedicalCenterModel> medicalCenters;
  final List<CategoryModel> categories;

  HomeDataModel({
    required this.medicalCenters,
    required this.categories,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);
}
