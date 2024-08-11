import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../bookings/cubit/bookings_cubit.dart';
import '../../bookings/presentation/bookings_screen.dart';
import '../../find_by_map/presentation/find_by_map_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  int index = 0;

  void changePage(int index) {
    this.index = index;
    emit(MainState.changing(index: index));
  }

  final List pages = [
    const HomeScreen(),
    const FindByMapScreen(),
    BlocProvider(
      create: (context) => getIt<BookingsCubit>()..getBookings(),
      child: const BookingsScreen(),
    ),
    const ProfileScreen(),
  ];
}
