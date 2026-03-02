import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static const TextStyle base16BoldGold = TextStyle(
    fontSize: 16,
    color: AppColors.gold,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle base16BoldCreamyYellow = TextStyle(
    fontSize: 16,
    color: AppColors.creamyYellow,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bold24DarkGray = TextStyle(
    fontSize: 24,
    color: AppColors.darkGray,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bold20White = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: .w700,
  );
}
