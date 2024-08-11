import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemini_comp/features/doctors/data/models/doctor_model.dart';

import '../../../../core/utils/user_data.dart';
import '../models/booking_model.dart';

abstract class BookingsRepo {
  Future<List<BookingModel>> getBookings();
  Future<DoctorModel> getDoctor(String doctorId);
}

class BookingsRepoImpl implements BookingsRepo {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference bookings = firestore.collection('bookings');
  CollectionReference doctors = firestore.collection('doctors');

  @override
  Future<List<BookingModel>> getBookings() async {
    List bookingsData = [];
    final user = UserData.instance.user;
    String? uid = user.uid;
    QuerySnapshot querySnapshot =
        await bookings.where('patient_id', isEqualTo: uid).get();
    bookingsData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final response = bookingsData.map((e) => BookingModel.fromJson(e)).toList();
    return response;
  }

  @override
  Future<DoctorModel> getDoctor(String doctorId) async {
    List doctorsData = [];
    QuerySnapshot querySnapshot =
        await doctors.where('id', isEqualTo: doctorId).get();
    doctorsData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final response = doctorsData;
    return response.map((e) => DoctorModel.fromJson(e)).toList().first;
  }
}
