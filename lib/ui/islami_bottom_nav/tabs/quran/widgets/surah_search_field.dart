import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_strings.dart';
import 'package:islami/utils/app_styles.dart';


class SurahSearchField extends StatefulWidget {
  final ValueChanged<String> onChangeSurahSearch;

  const SurahSearchField({super.key, required this.onChangeSurahSearch});

  @override
  State<SurahSearchField> createState() => _SurahSearchFieldState();
}

class _SurahSearchFieldState extends State<SurahSearchField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.gold),
    );

    return TextField(
      controller: controller,
      onChanged: widget.onChangeSurahSearch,
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