import 'package:gemini_comp/features/home/data/models/category_model.dart';

import '../data/models/doctor_model.dart';

class DoctorsState {
  final bool isLoading;
  final List<DoctorModel> doctors;
  final List<CategoryModel> specialists;
  final String? error;
  final String selectedSpecialist;
  final List<DoctorModel> filteredDoctors;

  const DoctorsState({
    this.doctors = const [],
    this.specialists = const [],
    this.isLoading = false,
    this.error,
    this.selectedSpecialist = "All",
    this.filteredDoctors = const [],
  });

  DoctorsState copyWith({
    List<DoctorModel>? doctors,
    List<CategoryModel>? specialists,
    bool? isLoading,
    String? error,
    String? selectedSpecialist,
    List<DoctorModel>? filteredDoctors,
  }) {
    return DoctorsState(
      doctors: doctors ?? this.doctors,
      specialists: specialists ?? this.specialists,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedSpecialist: selectedSpecialist ?? this.selectedSpecialist,
      filteredDoctors: filteredDoctors ?? this.filteredDoctors,
    );
  }
}
