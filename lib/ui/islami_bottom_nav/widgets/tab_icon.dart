import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/utils/app_colors.dart';

class TabIcon extends StatelessWidget {
  final String path;
  final bool isSelected;

  TabIcon({super.key, required this.path, this.isSelected = false});

  late final ColorFilter colorFilter = ColorFilter.mode(
    isSelected ? AppColors.white : AppColors.darkGray,
    BlendMode.srcIn,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66.r),
        color: isSelected ? AppColors.darkGray.withValues(alpha: .6) : null,
      ),
      child: SvgPicture.asset(path, colorFilter: colorFilter),
    );
  }
}
