import 'package:get_it/get_it.dart';

import '../../features/ai_assistant/cubit/ai_assistant_cubit.dart';
import '../../features/booking/cubit/book_appointment_cubit.dart';
import '../../features/booking/data/repo/book_appointment_repo.dart';
import '../../features/bookings/cubit/bookings_cubit.dart';
import '../../features/bookings/data/repo/bookings_repo.dart';
import '../../features/doctors/cubit/doctors_cubit.dart';
import '../../features/doctors/data/repo/doctors_repo.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/main/cubit/main_cubit.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/sign_up/cubit/sign_up_cubit.dart';
import '../../features/sign_up/data/repo/sign_up_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  // Dio dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  // sign_up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo());
  getIt.registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(getIt<SignUpRepo>()));

  // main
  getIt.registerLazySingleton<MainCubit>(() => MainCubit());

  // // notifications
  // getIt.registerLazySingleton<NotificationsSettingCubit>(
  //     () => NotificationsSettingCubit());

  // //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // //home
  getIt.registerLazySingleton<DoctorsRepo>(() => DoctorsRepoImpl());
  getIt.registerFactory<AiAssistantCubit>(
      () => AiAssistantCubit(getIt<DoctorsRepo>()));

  //  //booking
  getIt.registerLazySingleton<BookAppointmentRepo>(
      () => BookAppointmentRepoImpl());
  getIt.registerFactory<BookAppointmentCubit>(
      () => BookAppointmentCubit(getIt<BookAppointmentRepo>()));

  getIt.registerLazySingleton<BookingsRepo>(() => BookingsRepoImpl());
  getIt.registerFactory<BookingsCubit>(
      () => BookingsCubit(getIt<BookingsRepo>()));

  getIt.registerFactory<DoctorsCubit>(() => DoctorsCubit(getIt<DoctorsRepo>()));
}
