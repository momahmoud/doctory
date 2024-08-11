import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  @JsonKey(name: 'booking_id')
  final String bookingId;
  final String date;
  final String time;
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'patient_id')
  final String patientId;
  final String status;
  @JsonKey(name: 'doctor_name')
  final String? doctorName;
  @JsonKey(name: 'doctor_specialist')
  final String? doctorSpecialist;
  @JsonKey(name: 'doctor_address')
  final String? doctorAddress;
  @JsonKey(name: 'doctor_image')
  final String? doctorImage;

  const BookingModel({
    required this.bookingId,
    required this.date,
    required this.time,
    required this.doctorId,
    required this.patientId,
    required this.status,
    this.doctorName,
    this.doctorSpecialist,
    this.doctorAddress,
    this.doctorImage,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
