import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class Sebha extends StatelessWidget {
  final String currentZikr;
  final int count;
  final VoidCallback? onTap;

  const Sebha({
    super.key,
    required this.currentZikr,
    required this.count,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;

    final double sebhaSize =
    isPortrait ? media.size.width * .75 : media.size.height * 1.2;

    final double tagSize = isPortrait
        ? sebhaSize * .45
        : sebhaSize * .45;

    final double tagOverlap = tagSize * .50;

    return SizedBox(
      width: sebhaSize,
      height: sebhaSize + tagOverlap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              AppImages.bgAzkarCounterTag,
              width: tagSize,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: tagOverlap,
            child: Material(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                highlightColor: AppColors.darkGray.withValues(alpha: .6),
                splashFactory: NoSplash.splashFactory,
                child: Ink(
                  width: sebhaSize,
                  height: sebhaSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImages.bgAzkarCounter),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentZikr,
                        textAlign: TextAlign.center,
                        style: AppStyles.bold20White.copyWith(
                          fontSize: 36.sp,
                        ),
                      ),
                      Text(
                        '$count',
                        style: AppStyles.bold20White.copyWith(
                          fontSize: 36.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}