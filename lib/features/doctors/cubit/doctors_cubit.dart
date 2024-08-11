import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/data/models/category_model.dart';
import '../data/models/doctor_model.dart';
import '../data/repo/doctors_repo.dart';
import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsRepo _doctorsRepo;

  DoctorsCubit(this._doctorsRepo) : super(const DoctorsState());

  void makeTheCurrentSpecialistFirstElementInSpecialistList(
    List<CategoryModel> categories,
  ) {
    if (state.selectedSpecialist == "All") {
      emit(state.copyWith(specialists: categories));
      return;
    }
    int allIndex = categories.indexWhere((category) => category.id == 'all');
    int selectedIndex = categories
        .indexWhere((category) => category.name == state.selectedSpecialist);
    if (selectedIndex == -1) return;
    CategoryModel selectedCategory = categories.removeAt(selectedIndex);
    categories.insert(allIndex + 1, selectedCategory);
    emit(state.copyWith(specialists: categories));
  }

  Future<void> fetchDoctors() async {
    emit(state.copyWith(isLoading: true));
    try {
      final doctors = await _doctorsRepo.fetchDoctors();
      emit(state.copyWith(doctors: doctors, isLoading: false));
      filterDoctorsBySpecialist();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> changeSpecialist(String specialist) async {
    emit(state.copyWith(selectedSpecialist: specialist));
  }

  void filterDoctorsBySpecialist() {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final List<DoctorModel> filteredDoctors = [];
    Timer(const Duration(milliseconds: 300), () {
      if (state.selectedSpecialist == "All") {
        filteredDoctors.addAll(state.doctors);
        emit(state.copyWith(
          filteredDoctors: filteredDoctors,
          isLoading: false,
        ));
      } else {
        for (var doctor in state.doctors) {
          if (state.selectedSpecialist.toLowerCase().contains(
                doctor.specialist.toLowerCase(),
              )) {
            filteredDoctors.add(doctor);
          }
        }
        emit(state.copyWith(
          filteredDoctors: filteredDoctors,
          isLoading: false,
        ));
      }
    });
  }
}
