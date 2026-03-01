import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/widgets/islami_header.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String? description;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 40,
        children: [
          IslamiHeader(),
          Image.asset(image),
          Visibility(visible: description == null, child: SizedBox(height: 40)),
          Text(
            title,
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
      
          Visibility(
            visible: description != null,
            child: Text(
              description ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
