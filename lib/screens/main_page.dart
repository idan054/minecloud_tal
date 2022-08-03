import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/resetPass_page.dart';
import 'package:minecloud_tal/screens/signUp_page.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../dashboard.dart';
import '../functions/loadingDialogW.dart';
import '../widgets/components/login_bottomSignUp.dart';
import '../widgets/buttonsWs.dart';
import '../widgets/components/mainBoardingSlider.dart';
import '../widgets/simpleWs.dart';
import 'main_page.dart';
import 'onBoarding_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPassHidden = true;

  Widget containerDivider() => Expanded(child: lightDivider());
  Timer? timer;
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer t) {
      // _pageController.nextPage(
      //     curve: Curves.easeInOut,
      //     duration: const Duration(milliseconds: 150));
      try {
        setState(() {
          _selectedIndex = _selectedIndex + 1;
          if (_selectedIndex == 3) _selectedIndex = 0;
          // print('_selectedIndex $_selectedIndex');
          _pageController.animateToPage(_selectedIndex,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 250));
        });
      } catch (e) {
        print('Something went wrong at _pageController');
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
          backgroundColor: kEmptyColor,
          body: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const 5;
            } else {
              return Row(
                children: [
                  Flexible(
                    child: MainBoardingSlider(_selectedIndex, _pageController),
                  ),
                  const SizedBox(width: 400,
                      child: ResetPassMobile()
                  ),
                ],
              );
            }
          })),
    );
  }
}
