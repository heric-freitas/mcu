import 'package:flutter/material.dart';
import 'package:marvel/src/core/styles/app_color.dart';
import 'package:marvel/src/core/styles/app_styles.dart';

import '../styles/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.instance.primary,
      primary: AppColor.instance.primary,
      secondary: AppColor.instance.secundary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: AppTextStyles.instance.textRegular.copyWith(color: Colors.black,),
      errorStyle: AppTextStyles.instance.textRegular.copyWith(color: Colors.redAccent,),
    ),
  );
}