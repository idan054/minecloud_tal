import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/string_constants.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainBoardingSlider extends StatefulWidget {
  const MainBoardingSlider({Key? key}) : super(key: key);

  @override
  State<MainBoardingSlider> createState() => MainBoardingSliderState();
}

class MainBoardingSliderState extends State<MainBoardingSlider> {
  int selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer t) {
      setState(() {
        selectedIndex += 1;
        if (selectedIndex == 3) selectedIndex = 0;
      });
      pageController.animateToPage(selectedIndex, curve: Curves.easeInOut, duration: const Duration(milliseconds: 250));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = maxHeight(context) / 100;
    return Column(
      children: [
        SizedBox(
          height: height * 60,
          child: PageView(
            controller: pageController,
            // onPageChanged: (pageIndex) => setState(() => selectedIndex = pageIndex),
            children: [
              buildMainBlock(
                image: 'assets/images/sync_mcrft.png',
                title: StringConstant.syncData,
                desc: StringConstant.syncDataDesc,
              ),
              buildMainBlock(
                image: 'assets/images/windows_boarding.png',
                title: StringConstant.windows,
                desc: StringConstant.windowsDesc,
              ),
              buildMainBlock(
                image: 'assets/images/not_just_worlds.png',
                title: StringConstant.notWords,
                desc: StringConstant.notWordsDesc,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, top: 16),
          child: Builder(builder: (context) {
            double size = 7;
            return SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: SlideEffect(
                spacing: size + 2,
                radius: size,
                dotWidth: size,
                dotHeight: size,
                paintStyle: PaintingStyle.fill,
                activeDotColor: Colors.white,
                dotColor: Colors.white24,
                strokeWidth: 1,
                // dotColor: cGrey100,
                // activeDotColor: cRilDarkPurple.withOpacity(0.65)),
              ),
            );
          }),
        ),
      ],
    );
  }

  Column buildMainBlock({title, desc, image}) {
    double height = maxHeight(context) / 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset('$image', height: height * 40, fit: BoxFit.cover),
        ),
        Text(
          '$title',
          style: poppinsMedium().copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
          child: Text(
            '$desc',
            textAlign: TextAlign.center,
            style: poppinsRegular().copyWith(color: kImportantWhite80),
          ),
        ),
      ],
    );
  }
}
