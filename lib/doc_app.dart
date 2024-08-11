import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors.dart';
import 'core/utils/shared_prefs.dart';

class DocApp extends StatefulWidget {
  const DocApp({super.key});

  @override
  State<DocApp> createState() => _DocAppState();
}

class _DocAppState extends State<DocApp> {
  bool isSeen = false;
  bool isLoggedIn = false;
  @override
  void initState() {
    getIsSeenAndIsLoggedIn();
    super.initState();
  }

  void getIsSeenAndIsLoggedIn() async {
    setState(() {
      isSeen = SharedPreferencesService.getData("seen") != null;
      isLoggedIn = SharedPreferencesService.getSecureData("isLoggedIn") != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Doc App',
          theme: ThemeData(
            useMaterial3: false,
            fontFamily: "Inter",
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorsManger.primaryColor,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
              ),
              elevation: 0,
            ),
            primaryColor: ColorsManger.primaryColor,
            scaffoldBackgroundColor: ColorsManger.whiteColor,
            splashColor: Colors.transparent,
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: isSeen
              ? isLoggedIn
                  ? Routes.mainScreen
                  : Routes.login
              : Routes.onBoardingScreen,
        );
      },
    );
  }
}
