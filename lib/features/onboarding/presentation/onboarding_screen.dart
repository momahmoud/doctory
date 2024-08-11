import 'package:flutter/material.dart';
import 'package:gemini_comp/core/utils/spacing.dart';

import '../../../core/theme/colors.dart';
import 'widgets/onboarding_animated_dots_widget.dart';
import 'widgets/onboarding_get_started.dart';
import 'widgets/onboarding_list_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.whiteColor,
      body: Column(
        children: <Widget>[
          const OnboardingListWidget(),
          verticalSpacing(5),
          const OnboardingAnimatedDotsWidget(),
          verticalSpacing(28),
          const OnBoardingGetStarted(),
        ],
      ),
    );
  }
}
