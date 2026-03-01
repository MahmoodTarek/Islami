import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(top: 75, right: 65, left: 65, bottom: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.bgMosque),
          fit: BoxFit.fill,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final shader = textGradient.createShader(
            Rect.fromLTWH(0, 50, constraints.maxWidth, 250),
          );
          return Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 80,
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
