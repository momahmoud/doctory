import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/di/dependency_injection.dart';
import 'package:gemini_comp/doc_app.dart';

import 'core/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesService.getInstance();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  Bloc.observer = MyCubitObserver();

  runApp(const DocApp());
}

class MyCubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }

    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('${bloc.runtimeType} $error');
    }
    super.onError(bloc, error, stackTrace);
  }
}
