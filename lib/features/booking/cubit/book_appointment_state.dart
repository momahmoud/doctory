class BookAppointmentState {
  final bool? isLoading;
  final String? error;
  final bool? success;
  final String? selectedDate;
  final String? selectedTime;

  BookAppointmentState({
    this.isLoading,
    this.error,
    this.success,
    this.selectedDate,
    this.selectedTime,
  });

  BookAppointmentState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
    String? selectedDate,
    String? selectedTime,
  }) {
    return BookAppointmentState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      success: success ?? this.success,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
