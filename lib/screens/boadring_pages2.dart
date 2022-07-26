import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../common/theme/constants.dart';
import '../widgets/buttonsWs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingPage2 extends StatefulWidget {
  const OnBoardingPage2({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage2> createState() => _OnBoardingPage2State();
}

class _OnBoardingPage2State extends State<OnBoardingPage2> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(child: Image.asset('assets/images/minecloudLogo.png')),
            SizedBox(
              height: 400,
              child: PageView(
                // physics: const NeverScrollableScrollPhysics(), // disable swipe
                controller: _pageController,
                onPageChanged: (pageIndex) {
                  // On Swipe left or right
                  setState(() => _selectedIndex = pageIndex);
                  // _pageController.jumpToPage(pageIndex);
                  _pageController.animateToPage(pageIndex,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 150));
                },
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 50),
                      FlutterLogo(
                        size: 200,
                      ),
                      Text(
                        'Sync your Minecraft',
                        style: poppinsMedium(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
                        child: Text(
                          'Upload your Minecraft projects to the'
                          ' cloud and sync your assets automatically '
                          'across devices',
                          textAlign: TextAlign.center,
                          style: poppinsRegular().copyWith(color: kDetailedWhite60),
                        ),
                      )
                    ],
                  ),
                  Scaffold(backgroundColor: Colors.yellow),
                  Scaffold(backgroundColor: Colors.blue)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Builder(
                builder: (context) {
                  double size = 7;
                  return SmoothPageIndicator(
                    controller: _pageController,
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
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: positiveButton('Next', onPressed: () async {
                // _pageController.jumpToPage(pageIndex);
                _pageController.nextPage(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 150));
              }),
            ),
            SizedBox(height: kMediaQuerySize(context).height * 0.075),
          ],
        ),
      ),
    );
  }
}
