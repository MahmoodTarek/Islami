import 'package:flutter/material.dart';
import 'package:islami/utils/widgets/islami_header.dart';

class IslamiPageLayout extends StatelessWidget {
  final String? backgroundImagePath;
  final String? backgroundColor;
  final bool setIslamiHeader;
  final Widget content;
  final bool scrollable;

  const IslamiPageLayout({
    super.key,
    this.backgroundImagePath,
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
              content
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
        image: backgroundImagePath == null
            ? null
            : DecorationImage(
                image: AssetImage(backgroundImagePath!),
                fit: BoxFit.fill,
              ),
      ),
      child: scrollable ?  SingleChildScrollView(child: body) : body,
    );
  }
}
