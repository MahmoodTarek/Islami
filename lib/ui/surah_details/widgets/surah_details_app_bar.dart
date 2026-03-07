import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SurahDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String surahName;

  const SurahDetailsAppBar({super.key, required this.surahName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.gold,
      centerTitle: true,
      leadingWidth: 48,
      leading: Padding(
        padding: EdgeInsets.only(left: 28),
        child: InkWell(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(AppIcons.icPrevArrow),
        ),
      ),
      title: Text(
        surahName,
        style: AppStyles.bold20White.copyWith(color: AppColors.gold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
