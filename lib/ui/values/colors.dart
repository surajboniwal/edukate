import 'dart:math';

import 'package:flutter/painting.dart';

class AppColors {
  static final Color primaryColor = Color(0xFFFDF8EE);
  static final Color accentColor = Color(0xFF230A51);
  static final Color whiteColor = Color(0xFFFFFFFF);
  static final Color greyColor = Color(0xFF818389);
  static final Color lightGreyColor = Color(0xFFE7E0DE);
  static final Color yellowColor = Color(0xFFF4C823);
  static final Color redColor = Color(0xFFCF4136);
  static Color get randomColor => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.7);
}
