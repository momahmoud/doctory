import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;
  AppLocalizations({this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedValues = {};

  Future<void> load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');
    Map<String, dynamic> map = jsonDecode(jsonString);
    _localizedValues = map.map((key, value) => MapEntry(key, value as String));
  }

  String? translate(String key) {
    return _localizedValues[key] ?? '';
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
