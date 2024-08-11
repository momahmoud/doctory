import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_center_model.g.dart';

@JsonSerializable()
class MedicalCenterModel {
  final String id;
  final String name;
  String? image;
  final String? description;
  final String? address;
  final String? phone;
  final String? latitude;
  final String? longitude;
  final String? type;
  final int? reviews;
  final double? rating;
  final String? distance;

  MedicalCenterModel({
    required this.id,
    required this.name,
    this.image,
    this.description,
    this.address,
    this.phone,
    this.latitude,
    this.longitude,
    this.type,
    this.reviews,
    this.rating,
    this.distance,
  });

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalCenterModelFromJson(json);
}
