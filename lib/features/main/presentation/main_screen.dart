import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_state.dart';
import 'widgets/bottom_nav_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return Scaffold(
      backgroundColor: ColorsManger.whiteColor,
      bottomNavigationBar: const BottomNavWidget(),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return SafeArea(
            child: mainCubit.pages[mainCubit.index],
          );
        },
      ),
    );
  }
}
