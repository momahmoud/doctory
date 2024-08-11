import 'package:flutter/widgets.dart';

import 'font_manager.dart';
import 'font_styles.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    {double? height}) {
  return TextStyle(
    fontFamily: FontStyles.fontFamily,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height,
  );
}

//regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s16, required Color color, double? height}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    height: height,
  );
}

//medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s18, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,
      height: height);
}

//light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s16, required Color color, double? height}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
    height: height,
  );
}

//bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s16, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, height: height);
}

TextStyle getBolderStyle(
    {double fontSize = FontSize.s26, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.bolder, color,
      height: height);
}

//semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s16,
    required Color color,
    double height = 1.4}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      height: height);
}
