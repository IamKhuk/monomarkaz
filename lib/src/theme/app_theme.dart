import 'package:flutter/material.dart';

import '../../main.dart';

class AppTheme{
  /// Colors
  static const Color bg = Color(0xFFF2F6FE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF06a3da);
  static const Color yellow = Color(0xFFffd504);
  static const Color red = Color(0xFFfe3019);
  static const Color green = Color(0xFF1dc86c);
  static const Color black = Color(0xFF080A24);
  static const Color dark = Color(0xFF3A3F4D);
  static const Color baseColor = Color(0xFFEBEBF4);
  static const Color gray = Color(0xFF8D989D);
  static Color light = isLightMode == true? const Color(0xFFBCC7D1):const Color(0xFFB5B6B7);
  static const Color highlightColor = Color(0xFFF4F4F4);
  static const Color lightTwo = Color(0xFFE8EDF0);


  /// Fonts
  static const String fontFamily = "Roboto";
}