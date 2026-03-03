import 'package:flutter/material.dart';
import 'package:islami/utils/widgets/islami_header.dart';

class IslamiPageLayout extends StatelessWidget {
  final String? backgroundImage;
  final String? backgroundColor;
  final bool setIslamiHeader;
  final Widget content;
  final bool scrollable;

  const IslamiPageLayout({
    super.key,
    this.backgroundImage,
    this.backgroundColor,
    required this.content,
    this.setIslamiHeader = true,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget body = SafeArea(
      child: Column(
          children: [
            if (setIslamiHeader) const IslamiHeader(),
            if (scrollable)
              SingleChildScrollView(child: content)
            else
              Expanded(child: content),
          ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor == null
            ? null
            : Color(int.parse(backgroundColor!)),
        image: backgroundImage == null
            ? null
            : DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.fill,
              ),
      ),
      child: body,
    );
  }
}
