
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/login/login.dart';

import '../common/theme/constants.dart';
import '../widgets/buttonsWs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _selectedIndex = 0;
  final PageController _pageController
      = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                // color: Colors.green,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/circleBG_cut.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(child: Image.asset('assets/images/minecloudLogo.png')),
                SizedBox(
                  height: 450,
                  child: PageView(
                    // physics: const NeverScrollableScrollPhysics(), // disable swipe
                    controller: _pageController,
                    onPageChanged: (pageIndex) {
                      setState(() => _selectedIndex = pageIndex);
                      // On Swipe left or right
                      // _pageController.jumpToPage(pageIndex);
                      _pageController.animateToPage(pageIndex,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 150));
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
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Builder(builder: (context) {
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
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: _selectedIndex == 2
                      ? positiveButton('Get Started',
                          onPressed: () => kPushNavigator(context,  LoginScreen(),
                              replace: true))
                      : positiveButton('Next', onPressed: () async {
                          // _pageController.jumpToPage(pageIndex);
                          _pageController.nextPage(
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 150));
                        }),
                ),
                SizedBox(height: kMediaQuerySize(context).height * 0.075),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column buildMainBlock({title, desc, image}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset('$image'),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
