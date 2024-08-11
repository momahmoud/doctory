import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemini_comp/features/doctors/data/models/doctor_model.dart';

import '../../../../core/utils/user_data.dart';

abstract class BookAppointmentRepo {
  Future<dynamic> bookAppointment({
    required String bookingId,
    required String date,
    required String time,
    required DoctorModel doctor,
    required String patientId,
  });
}

class BookAppointmentRepoImpl implements BookAppointmentRepo {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference bookings = firestore.collection('bookings');
  @override
  Future<void> bookAppointment({
    required String bookingId,
    required String date,
    required String time,
    required DoctorModel doctor,
    required String patientId,
  }) async {
    final user = UserData.instance.user;
    String? uid = user.uid;
    await bookings.doc(bookingId).set({
      'booking_id': bookingId,
      'date': date,
      'time': time,
      'doctor_id': doctor.id,
      "doctor_name": doctor.name,
      "doctor_specialist": doctor.specialist,
      "doctor_address": doctor.address,
      "doctor_image": doctor.image,
      'patient_id': uid,
      'status': 'upcoming',
    });
  }
}
