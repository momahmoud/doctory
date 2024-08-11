import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/images_constants.dart';
import '../../../core/utils/shared_prefs.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial(0));
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    emit(OnboardingState.initial(index));
  }

  void seen() {
    SharedPreferencesService.saveData("seen", true);
    emit(const OnboardingState.seen(true));
  }

  List<Map<String, dynamic>> onboardingList = [
    {
      "illustration": ImagesConstants.onboarding1,
      "title": "Meet Doctors Online",
      "text":
          "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
    },
    {
      "illustration": ImagesConstants.onboarding2,
      "title": "Connect with Specialists",
      "text":
          "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
    },
    {
      "illustration": ImagesConstants.onboarding3,
      "title": "Thousands of Online Specialists",
      "text":
          " Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.",
    },
  ];
}
