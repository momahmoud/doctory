import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final String id;
  final String name;
  final String specialist;
  final String? description;
  final String? city;
  final dynamic reviews;
  final dynamic rating;
  final String? image;
  final String? address;
  final int? patients;
  final int? experience;
  @JsonKey(name: 'work_times')
  final List<WorkTime>? workTimes;
  @JsonKey(name: 'reviews_list')
  final List<ReviewModel>? reviewsList;

  const DoctorModel({
    required this.id,
    required this.name,
    required this.specialist,
    this.image,
    this.description,
    this.city,
    this.reviews,
    this.rating,
    this.address,
    this.patients,
    this.experience,
    this.workTimes,
    this.reviewsList,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}

@JsonSerializable()
class WorkTime {
  final String? from;
  final String? to;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;

  const WorkTime({
    this.from,
    this.to,
    this.startTime,
    this.endTime,
  });

  factory WorkTime.fromJson(Map<String, dynamic> json) =>
      _$WorkTimeFromJson(json);
}

@JsonSerializable()
class ReviewModel {
  final String? name;
  final String? description;
  final double? rating;
  final String? image;

  const ReviewModel({
    this.name,
    this.description,
    this.rating,
    this.image,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
