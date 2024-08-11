// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      bookingId: json['booking_id'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      doctorId: json['doctor_id'] as String,
      patientId: json['patient_id'] as String,
      status: json['status'] as String,
      doctorName: json['doctor_name'] as String?,
      doctorSpecialist: json['doctor_specialist'] as String?,
      doctorAddress: json['doctor_address'] as String?,
      doctorImage: json['doctor_image'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
      'date': instance.date,
      'time': instance.time,
      'doctor_id': instance.doctorId,
      'patient_id': instance.patientId,
      'status': instance.status,
      'doctor_name': instance.doctorName,
      'doctor_specialist': instance.doctorSpecialist,
      'doctor_address': instance.doctorAddress,
      'doctor_image': instance.doctorImage,
    };
