import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class DecoratedContent extends StatelessWidget {
  final String title;
  final String content;
  final bool isDetailsScreen;
  final bool isLoading;

  const DecoratedContent({
    super.key,
    required this.title,
    required this.content,
    required this.isDetailsScreen,
    this.isLoading = false,
  });

  bool get showBasmala =>
      !(title.contains('الـحديث') ||
          title.contains('الحديث') ||
          title.contains('التوبة'));

  double get titleFontSize => title.length >= 17 ? 23 : 24;

  @override
  Widget build(BuildContext context) {
    final Color headerColor = isDetailsScreen
        ? AppColors.gold
        : AppColors.darkGray;

    final String footerDecoration = isDetailsScreen
        ? AppImages.imgDetailsBottom
        : AppImages.imgHadethCardBottom;

    final TextStyle contentStyle = isDetailsScreen
        ? AppStyles.description
        : AppStyles.label;

    final contentPadding = isDetailsScreen
        ? EdgeInsets.symmetric(horizontal: 12)
        : EdgeInsets.symmetric(horizontal: 12);

    return Stack(
      children: [
        if (!isDetailsScreen)
          BottomImage(
            isDetailsScreen: isDetailsScreen,
            footerDecoration: footerDecoration,
          ),

        Padding(
          padding: contentPadding,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  _HeaderDecoration(color: headerColor),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 32.h),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyles.bold24DarkGray.copyWith(
                          color: headerColor,
                          fontSize: titleFontSize.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 92.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: _buildContent(contentStyle),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isDetailsScreen)
          BottomImage(
            isDetailsScreen: isDetailsScreen,
            footerDecoration: footerDecoration,
          ),
      ],
    );
  }

  Widget _buildContent(TextStyle style) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.gold),
      );
    }

    if (!showBasmala) {
      return Text(
        content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: style,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: style,
        ),
        Text(
          content,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: style,
        ),
      ],
    );
  }
}

class BottomImage extends StatelessWidget {
  const BottomImage({
    super.key,
    required this.isDetailsScreen,
    required this.footerDecoration,
  });

  final bool isDetailsScreen;
  final String footerDecoration;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 112,
        width: double.infinity,
        color: isDetailsScreen ? AppColors.darkGray : null,
        child: Image.asset(
          footerDecoration,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}

class _HeaderDecoration extends StatelessWidget {
  final Color color;

  const _HeaderDecoration({required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(AppImages.imgLeftCorner, color: color),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(AppImages.imgRightCorner, color: color),
        ),
      ],
    );
  }
}
