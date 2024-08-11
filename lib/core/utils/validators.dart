import 'package:flutter/material.dart';

import '../constants/strings_constants.dart';
import 'app_regex.dart';

class Validators {
  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return StringsConstants.enterPassword;
    } else if (!AppRegex.isPasswordValid(value)) {}
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return StringsConstants.enterEmail;
    } else if (!AppRegex.isEmailValid(value)) {
      return StringsConstants.enterValidEmail;
    }
    return null;
  }
}
