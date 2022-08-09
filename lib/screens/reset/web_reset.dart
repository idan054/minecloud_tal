import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/constants.dart';
import '../../functions/svgIconWidget.dart';
import '../../functions/webpopups/buildIcons.dart';
import '../../widgets/components/login_bottomSignUp.dart';
import '../../widgets/buttonsWs.dart';
import '../../widgets/components/mainBoardingSlider.dart';
import '../../widgets/simpleWs.dart';
import '../login/login.dart';
import '../login/mobile_login.dart';

class WebResetPass extends StatefulWidget {
  const WebResetPass({Key? key}) : super(key: key);

  @override
  State<WebResetPass> createState() => _WebResetPassState();
}

class _WebResetPassState extends State<WebResetPass> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer t) {
      // _pageController.nextPage(
      //     curve: Curves.easeInOut,
      //     duration: const Duration(milliseconds: 150));

      setState(() {
        _selectedIndex = _selectedIndex + 1;
        if (_selectedIndex == 3) _selectedIndex = 0;
      });
      print('_selectedIndex $_selectedIndex');
      _pageController.animateToPage(_selectedIndex,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 250));
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = maxHeight(context) / 100;
    Widget containerDivider() => Expanded(
          child: lightDivider(),
        );

    return Container(
      // decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainBoardingSlider(_selectedIndex, _pageController),
                  SizedBox(
                    height: height * 2,
                  ),
                  buildIconRow(context),
                ],
              ),
            ),
            if (maxHeight(context) > 1300)
              Expanded(
                flex: 2,
                child: Container(),
              ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: kMediaQuerySize(context).height * 0.2,),

                  Center(child: Image.asset('assets/images/minecloudLogo.png')),

                  Container(
                    width: 400,
                    // height: kMediaQuerySize(context).height * 0.5,
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: darkPopupGradient,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Reset Password', style: poppinsMedium()),
                          darkTxtField(
                              label: 'Email', hintText: 'Enter your Email...'),
                          const SizedBox(
                            height: 30,
                          ),

                          // todo Backend Email Reset Here.
                          positiveButton('Send Email'),
                          Row(
                            children: [
                              containerDivider(),
                            ],
                          ),

                          secondaryIconButton(
                              text: 'Log In',
                              onPressed: () =>
                                  kPushNavigator(context, LoginScreen())),
                        ],
                      ),
                    ),
                  ),

                  // todo Add signup Page Here (& Backend).
                  bottomDividerTxtBtn("Don't have an account? ", "Sign Up."),
                ],
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
