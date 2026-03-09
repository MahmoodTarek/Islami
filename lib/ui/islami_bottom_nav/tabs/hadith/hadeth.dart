import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/data/hadeth_repository.dart';
import 'package:islami/models/hadeth.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/hadith/hadeth_args.dart';
import 'package:islami/ui/islami_bottom_nav/tabs/hadith/widgets/hadeth_card.dart';
import 'package:islami/ui/islami_bottom_nav/widgets/islami_page_layout.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_routes.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  late final CarouselSliderController controller;
  List<Hadeth> ahadeth = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = CarouselSliderController();
    loadData();
  }

  Future<void> loadData() async {
    final data = await HadethRepository().loadAhadeth();

    setState(() {
      ahadeth = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return IslamiPageLayout(
      scrollable: true,
      setIslamiHeader: true,
      backgroundImagePath: AppImages.bgHadith,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: CarouselSlider(
          carouselController: controller,
          items: ahadeth
              .map(
                (hadeth) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.hadethDetails,
                    arguments: HadethDetailsArgs(
                      hadeth: hadeth,
                      hadethCountNum: selectedIndex + 1,
                    ),
                  ),
                  child: HadethCard(
                    hadeth: hadeth.hadethContent,
                    hadethTitle: hadeth.hadethCountArabic,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: height * .66,
            aspectRatio: 16 / 9,
            initialPage: 0,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOutQuint,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
