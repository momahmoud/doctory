import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/location_helper.dart';
import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeState());

  void getCurrentLocation() async {
    await LocationHelper.determinePosition().then((value) async {
      String address = await LocationHelper.getAddress(value);
      emit(state.copyWith(currentLocation: address));
    });
  }

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await _homeRepo.fetchCategories();
      emit(state.copyWith(categories: categories, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> fetchMedicalCenters() async {
    emit(state.copyWith(isLoading: true));
    try {
      final medicalCenters = await _homeRepo.fetchMedicalCenters();
      emit(state.copyWith(medicalCenters: medicalCenters, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> fetchBanners() async {
    emit(state.copyWith(isLoading: true));
    try {
      final banners = await _homeRepo.fetchBanners();
      emit(state.copyWith(banners: banners, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
