import '../data/models/category_model.dart';
import '../data/models/medical_center_model.dart';

class HomeState {
  final List<CategoryModel>? categories;
  final List<MedicalCenterModel>? medicalCenters;
  final String currentLocation;
  final dynamic banners;
  final bool isLoading;
  final String? error;

  HomeState({
    this.categories,
    this.medicalCenters,
    this.banners,
    this.isLoading = false,
    this.error,
    this.currentLocation = '',
  });

  HomeState copyWith({
    List<CategoryModel>? categories,
    List<MedicalCenterModel>? medicalCenters,
    dynamic banners,
    bool? isLoading,
    String? error,
    String? currentLocation,
  }) {
    return HomeState(
      medicalCenters: medicalCenters ?? this.medicalCenters,
      categories: categories ?? this.categories,
      banners: banners ?? this.banners,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }
}
