part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial(int index) = _Initial;
  const factory OnboardingState.seen(bool isSeen) = _Seen;
}
