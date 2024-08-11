import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../cubit/sign_up_cubit.dart';
import '../../cubit/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.primaryColor,
                  ),
                );
              },
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.mainScreen);
          },
          error: (error) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
