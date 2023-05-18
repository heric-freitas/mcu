import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;
  
  AppColor._();
  static AppColor get instance{
    _instance??=  AppColor._();
    return _instance!;
   }

   Color get primary => const Color(0xFF007D21);
   Color get secundary => const Color(0xFF700611);
   Color get black => const Color(0xFF140E0E);
}

extension AppColorExtensions on BuildContext {
  AppColor get colors => AppColor.instance;
}