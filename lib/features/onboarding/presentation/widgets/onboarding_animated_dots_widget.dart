import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors.dart';
import '../../cubit/onboarding_cubit.dart';

class OnboardingAnimatedDotsWidget extends StatelessWidget {
  const OnboardingAnimatedDotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final onboardingCubit = context.read<OnboardingCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardingCubit.onboardingList.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 6),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 5,
                width: onboardingCubit.index == index ? 32 : 12,
                decoration: BoxDecoration(
                  color: onboardingCubit.index == index
                      ? ColorsManger.primaryColor
                      : ColorsManger.greyColor300,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
