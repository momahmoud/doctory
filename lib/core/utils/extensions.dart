import 'package:flutter/material.dart';

import '../localizations/app_localizations.dart';

extension CapitalizeString on String {
  String capitalize() {
    //capitalize the first letter from every word
    return split(" ")
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .join(" ");
  }
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

extension TranslateText on String {
  String? tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
