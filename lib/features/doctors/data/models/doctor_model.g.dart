// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialist: json['specialist'] as String,
      image: json['image'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      reviews: json['reviews'],
      rating: json['rating'],
      address: json['address'] as String?,
      patients: (json['patients'] as num?)?.toInt(),
      experience: (json['experience'] as num?)?.toInt(),
      workTimes: (json['work_times'] as List<dynamic>?)
          ?.map((e) => WorkTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsList: (json['reviews_list'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialist': instance.specialist,
      'description': instance.description,
      'city': instance.city,
      'reviews': instance.reviews,
      'rating': instance.rating,
      'image': instance.image,
      'address': instance.address,
      'patients': instance.patients,
      'experience': instance.experience,
      'work_times': instance.workTimes,
      'reviews_list': instance.reviewsList,
    };

WorkTime _$WorkTimeFromJson(Map<String, dynamic> json) => WorkTime(
      from: json['from'] as String?,
      to: json['to'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$WorkTimeToJson(WorkTime instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'rating': instance.rating,
      'image': instance.image,
    };
