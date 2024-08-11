import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_comp/features/ai_assistant/cubit/ai_assistant_cubit.dart';
import 'package:gemini_comp/features/ai_assistant/presentation/ai_assistant_screen.dart';
import 'package:gemini_comp/features/booking/presentation/book_appointment_screen.dart';
import 'package:gemini_comp/features/bookings/presentation/bookings_screen.dart';
import 'package:gemini_comp/features/doctors/presentation/doctors_screen.dart';

import '../../features/doctors/cubit/doctors_cubit.dart';
import '../../features/doctors/data/models/doctor_model.dart';
import '../../features/booking/cubit/book_appointment_cubit.dart';
import '../../features/bookings/cubit/bookings_cubit.dart';
import '../../features/doctor_details/presentation/doctor_details_screen.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/data/models/category_model.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/presentation/login_screen.dart';
import '../../features/main/cubit/main_cubit.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/sign_up/cubit/sign_up_cubit.dart';
import '../../features/sign_up/presentation/sign_up_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: const OnBoardingScreen(),
          ),
        );

      // case Routes.settings:
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      // case Routes.forgotPassword:
      //   return MaterialPageRoute(builder: (_) => const ForgotPassword());

      // case Routes.notificationsSetting:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<NotificationsSettingCubit>(),
      //       child: const NotificationsSettingScreen(),
      //     ),
      //   );

      // case Routes.notifications:
      //   return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<MainCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()
                  ..getCurrentLocation()
                  ..fetchCategories()
                  ..fetchMedicalCenters(),
              ),
            ],
            child: const MainScreen(),
          ),
        );
      case Routes.aiAssistant:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AiAssistantCubit>()..fetchDoctors(),
            child: const AiAssistantScreen(),
          ),
        );
      case Routes.doctorDetails:
        return MaterialPageRoute(
          builder: (_) {
            final doctor = settings.arguments as DoctorModel;
            return DoctorDetailsScreen(doctor: doctor);
          },
        );
      case Routes.bookAppointment:
        return MaterialPageRoute(
          builder: (_) {
            final doctor = settings.arguments as DoctorModel;
            return BlocProvider(
              create: (context) => getIt<BookAppointmentCubit>()..init(),
              child: BookAppointmentScreen(doctor: doctor),
            );
          },
        );
      case Routes.bookings:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => getIt<BookingsCubit>()..getBookings(),
              child: const Scaffold(body: SafeArea(child: BookingsScreen())),
            );
          },
        );
      case Routes.doctors:
        return MaterialPageRoute(
          builder: (_) {
            final arguments = settings.arguments as List;
            final category = arguments[0] as String;
            final categoryList = arguments[1] as List<CategoryModel>;

            return BlocProvider(
              create: (context) => getIt<DoctorsCubit>()
                ..fetchDoctors()
                ..changeSpecialist(category)
                ..makeTheCurrentSpecialistFirstElementInSpecialistList(
                  [...categoryList],
                ),
              child: DoctorsScreen(categories: categoryList),
            );
          },
        );

      default:
        return null;
    }
  }
}
