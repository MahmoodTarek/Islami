import 'package:flutter/material.dart';
import '../app_colors.dart';

class IslamiScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? headerSection;
  final Widget content;
  final String? backgroundImage;
  final Color? backgroundColor;
  final Widget? bottomSection;

  const IslamiScaffold({
    super.key,
    this.appBar,
    this.headerSection,
    required this.content,
    this.backgroundImage,
    this.bottomSection,
    this.backgroundColor = AppColors.darkGray,
  });

  @override
  Widget build(BuildContext context) {
    final DecorationImage? backgroundImageDecoration = backgroundImage != null
        ? DecorationImage(
      image: AssetImage(backgroundImage!),
      fit: BoxFit.fill,
    )
        : null;

    return Container(
      decoration: BoxDecoration(image: backgroundImageDecoration),
      child: Scaffold(
        backgroundColor:
        backgroundImage == null ? backgroundColor : Colors.transparent,
        appBar: appBar,
        body: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: Column(
                  children: [
                    headerSection ?? const SizedBox(),
                    Expanded(
                      child: content,
                    ),
                  ],
                ),
              ),
            ),
            bottomSection ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}