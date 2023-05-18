import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  // Avoid self isntance
  AppTextStyles._();
  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  final marvel = 'Marvel';


  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: marvel,
      );


  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: marvel,
      );


  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
  TextStyle get text => textRegular.copyWith(fontSize: 18);
  TextStyle get textTitle => textBold.copyWith(fontSize: 22);
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
