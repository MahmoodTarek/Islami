import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_strings.dart';

class IslamiHeader extends StatelessWidget {
  const IslamiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textGradient = LinearGradient(
      colors: [AppColors.camel, AppColors.softYellow],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 50.h, right: 65.w, left: 65.w),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bgMosqueHeader),
          fit: BoxFit.contain,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final shader = textGradient.createShader(
            Rect.fromLTWH(0, 40, constraints.maxWidth, 250),
          );
          return Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 80.sp,
              height: 1.4,
              fontWeight: FontWeight.w400,
              fontFamily: 'Kamail',
              foreground: Paint()..shader = shader,
            ),
          );
        },
      ),
    );
  }
}
