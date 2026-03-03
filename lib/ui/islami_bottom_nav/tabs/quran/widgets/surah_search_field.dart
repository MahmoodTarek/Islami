import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_strings.dart';
import 'package:islami/utils/app_styles.dart';


class SurahSearchField extends StatelessWidget {
  const SurahSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.gold),
    );

    return TextField(
      decoration: InputDecoration(
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder,
        filled: true,
        fillColor: AppColors.darkGray.withValues(alpha: 0.7),
        hintText: AppStrings.homeSearchHint,
        hintStyle: AppStyles.base16BoldCreamyYellow,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(AppIcons.icSearch),
        ),
        contentPadding: const EdgeInsets.all(14),
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: AppStyles.base16BoldCreamyYellow,
      cursorColor: AppColors.gold,
      keyboardType: TextInputType.text,
      maxLines: 1,
    );
  }
}
