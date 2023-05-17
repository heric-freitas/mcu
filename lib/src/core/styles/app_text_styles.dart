import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  // Avoid self isntance
  AppTextStyles._();
  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get textLight => const TextStyle(
        fontWeight: FontWeight.w300,
      );
  TextStyle get textRegular => const TextStyle(
        fontWeight: FontWeight.normal,
      );
  TextStyle get textMedium => const TextStyle(
        fontWeight: FontWeight.w500,
      );
  TextStyle get textSemiBold => const TextStyle(
        fontWeight: FontWeight.w600,
      );
  TextStyle get textBold => const TextStyle(
        fontWeight: FontWeight.bold,
      );
  TextStyle get textExtraBold => const TextStyle(
        fontWeight: FontWeight.w800,
      );

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
  TextStyle get text => textRegular.copyWith(fontSize: 18);
  TextStyle get textTitle => textExtraBold.copyWith(fontSize: 22);
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
