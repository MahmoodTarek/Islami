import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class Sebha extends StatelessWidget {
  static const double _radius = 220;
  static const double _topPadding = 76;
  static const double _contentTopPadding = 26;

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

    final height = isPortrait
        ? media.size.height * .4
        : media.size.height * .8;

    final width = isPortrait
        ? media.size.width * .9
        : media.size.width * .4;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(AppImages.bgAzkarCounterTag),

        Padding(
          padding: const EdgeInsets.only(top: _topPadding),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(_radius),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(_radius),
              overlayColor: WidgetStatePropertyAll(
                AppColors.darkGray.withValues(alpha: 0.5),
              ),
              child: Ink.image(
                height: height,
                width: width,
                image: const AssetImage(AppImages.bgAzkarCounter),
                fit: BoxFit.fill,
                child: Padding(
                  padding: const EdgeInsets.only(top: _contentTopPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentZikr,
                        textAlign: TextAlign.center,
                        style: AppStyles.bold20White
                            .copyWith(fontSize: 36),
                      ),
                      Text(
                        '$count',
                        style: AppStyles.bold20White
                            .copyWith(fontSize: 36),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}