import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/shared_prefs.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  void changeLocal(String languageCode) {
    SharedPreferencesService.saveData("LOCALE", languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }

  Future<void> getSavedLocale() async {
    final cachedLanguageCode = _checkLangCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  _checkLangCode() {
    final cachedLanguageCode = SharedPreferencesService.getData("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
