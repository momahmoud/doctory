import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_comp/features/bookings/cubit/bookings_state.dart';

import '../data/models/booking_model.dart';
import '../data/repo/bookings_repo.dart';

class BookingsCubit extends Cubit<BookingsState> {
  final BookingsRepo _bookingsRepo;
  BookingsCubit(this._bookingsRepo) : super(BookingsState());

  Future<void> changeStatus(String status) async {
    emit(state.copyWith(status: status));
  }

  void getBookings() async {
    emit(state.copyWith(isLoading: true));
    try {
      final bookings = await _bookingsRepo.getBookings();
      emit(state.copyWith(bookings: bookings, isLoading: false));
      filterBookingsByStatus();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void filterBookingsByStatus() {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final List<BookingModel> filteredBookings = [];
    Timer(const Duration(milliseconds: 300), () {
      for (var booking in state.bookings!) {
        if (booking.status.toLowerCase() == state.status.toLowerCase()) {
          filteredBookings.add(booking);
        }
      }
      emit(state.copyWith(
        filteredBookings: filteredBookings,
        isLoading: false,
      ));
    });
  }
}
