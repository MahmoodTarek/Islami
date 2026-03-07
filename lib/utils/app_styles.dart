import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static final TextStyle base16BoldGold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.gold,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle base16BoldCreamyYellow = TextStyle(
    fontSize: 16.sp,
    color: AppColors.creamyYellow,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle bold24DarkGray = TextStyle(
    fontSize: 24.sp,
    color: AppColors.darkGray,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle bold20White = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: .w700,
  );
}
