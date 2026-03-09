import 'package:flutter/material.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/hadith/hadeth_args.dart';
import 'package:islami/ui/widgets/decorated_content.dart';

import '../widgets/islami_app_bar.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as HadethDetailsArgs;

    return Scaffold(
      appBar: IslamiAppBar(title: 'Hadeth ${args.hadethCountNum}'),
      body: DecoratedContent(
        title: args.hadeth.hadethCountArabic,
        content: args.hadeth.hadethContent,
        isDetailsScreen: true,
      ),
    );
  }
}
