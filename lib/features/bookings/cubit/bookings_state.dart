import '../data/models/booking_model.dart';

class BookingsState {
  final List<BookingModel>? bookings;
  final List<BookingModel>? filteredBookings;
  final String status;
  final bool isLoading;
  final String? error;

  BookingsState({
    this.bookings,
    this.filteredBookings,
    this.isLoading = false,
    this.error,
    this.status = 'upcoming',
  });

  BookingsState copyWith({
    List<BookingModel>? bookings,
    List<BookingModel>? filteredBookings,
    bool? isLoading,
    String? error,
    String? status,
  }) {
    return BookingsState(
      bookings: bookings ?? this.bookings,
      filteredBookings: filteredBookings ?? this.filteredBookings,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
