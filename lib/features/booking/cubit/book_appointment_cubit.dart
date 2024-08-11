import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_comp/features/doctors/data/models/doctor_model.dart';
import 'package:gemini_comp/features/booking/data/repo/book_appointment_repo.dart';

import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentRepo _bookAppointmentRepo;
  BookAppointmentCubit(this._bookAppointmentRepo)
      : super(BookAppointmentState());

  void setSelectedDate(String date) {
    emit(state.copyWith(selectedDate: date));
  }

  void setSelectedTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  void reset() {
    emit(BookAppointmentState());
  }

  void init() {
    emit(state.copyWith(
      selectedDate: DateTime.now().toIso8601String(),
      selectedTime: '',
    ));
  }

  void confirmBooking({
    required DoctorModel doctor,
    required String patientId,
  }) async {
    emit(state.copyWith(isLoading: true, success: false));
    try {
      await _bookAppointmentRepo.bookAppointment(
        bookingId: '${DateTime.now().millisecondsSinceEpoch}',
        date: state.selectedDate!,
        time: state.selectedTime!,
        doctor: doctor,
        patientId: patientId,
      );
      emit(state.copyWith(isLoading: false, success: true));
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), isLoading: false, success: false));
    }
  }
}
