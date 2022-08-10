import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainBoardingSlider extends StatefulWidget {
  final int selectedIndex;
  final PageController pageController;

  const MainBoardingSlider(
    this.selectedIndex,
    this.pageController, {Key? key}) : super(key: key);

  @override
  State<MainBoardingSlider> createState() => _MainBoardingSliderState();
}

class _MainBoardingSliderState extends State<MainBoardingSlider> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex = widget.selectedIndex;
    var pageController = widget.pageController;
  var height =  maxHeight(context) / 100;
    return Column(
      children: [
        SizedBox(
          height: height*60,
          child: PageView(
            controller: pageController,
            onPageChanged: (pageIndex) {
              // print('In sIx: $selectedIndex');
              setState(() => selectedIndex = pageIndex);
            },
            children: [
              buildMainBlock(
                image: 'assets/images/sync_mcrft.png',
                title: 'Sync your Minecraft',
                desc: 'Upload your Minecraft projects to the'
                    ' cloud and sync your assets automatically '
                    'across devices',
              ),
              buildMainBlock(
                image: 'assets/images/windows_boarding.png',
                title: 'Windows & Android 9/10',
                desc: 'Compatible with Minecraft'
                    'Bedrock Edition for Windows'
                    'and mentioned Android devices',
              ),
              buildMainBlock(
                image: 'assets/images/not_just_worlds.png',
                title: 'Not just worlds...',
                desc: 'Minecloud allows you to'
                    'sync any asset from the game:'
                    'worlds, addons and skin packs!',
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
    var height =  maxHeight(context) / 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset('$image',height: height*40,fit: BoxFit.cover,),
        ),
        Text(
          '$title',
          style: poppinsMedium().copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Text(
            '$desc',
            textAlign: TextAlign.center,
            style: poppinsRegular().copyWith(color: kImportantWhite80),
          ),
        )
      ],
    );
  }
}
