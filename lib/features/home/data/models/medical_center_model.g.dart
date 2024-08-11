// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalCenterModel _$MedicalCenterModelFromJson(Map<String, dynamic> json) =>
    MedicalCenterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      type: json['type'] as String?,
      reviews: (json['reviews'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      distance: json['distance'] as String?,
    );

Map<String, dynamic> _$MedicalCenterModelToJson(MedicalCenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': instance.type,
      'reviews': instance.reviews,
      'rating': instance.rating,
      'distance': instance.distance,
    };
