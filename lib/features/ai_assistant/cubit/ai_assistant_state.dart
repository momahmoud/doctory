import '../../doctors/data/models/doctor_model.dart';

class AiAssistantState {
  final List<DoctorModel>? doctors;
  final List<DoctorModel>? doctorsBasedOnAi;
  final bool isLoading;
  final String? error;
  final String? message;

  AiAssistantState({
    this.doctors,
    this.doctorsBasedOnAi,
    this.isLoading = false,
    this.error,
    this.message,
  });

  AiAssistantState copyWith({
    List<DoctorModel>? banners,
    List<DoctorModel>? doctorsBasedOnAi,
    dynamic doctors,
    bool? isLoading,
    String? error,
    String? message,
  }) {
    return AiAssistantState(
      doctorsBasedOnAi: doctorsBasedOnAi ?? this.doctorsBasedOnAi,
      doctors: doctors ?? this.doctors,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
