import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/reset/mobile_reset.dart';
import 'package:minecloud_tal/screens/reset/reset.dart';
import 'package:minecloud_tal/screens/signup/mobile_signup.dart';
import 'package:minecloud_tal/screens/signup/signup.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/constants.dart';
import '../Dashboard/dashboard.dart';
import '../Dashboard/mobile_dasboard.dart';
import '../../functions/loadingDialogW.dart';
import '../../widgets/components/login_bottomSignUp.dart';
import '../../widgets/buttonsWs.dart';
import '../../widgets/components/mainBoardingSlider.dart';
import '../../widgets/simpleWs.dart';
import '../onBoarding_page.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  bool isPassHidden = true;

  Widget containerDivider() => Expanded(child: lightDivider());
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
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: const Scaffold(
          backgroundColor: kEmptyColor,
          body:LoginMobile()),
          //  LayoutBuilder(builder: (context, constraints) {
          //   if (constraints.maxWidth < 600) {
          //     return LoginMobile();
          //   } else {
          //     return Row(
          //       children: [
          //         Flexible(
          //           child: MainBoardingSlider(_selectedIndex, _pageController),
          //         ),
          //         SizedBox(width: 400, child: LoginMobile()),
          //       ],
          //     );
          //   }
          // })),
    );
  }
}

class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  bool isPassHidden = true;

  Widget containerDivider() => Expanded(child: lightDivider());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // SizedBox(height: kMediaQuerySize(context).height * 0.2,),
        const SizedBox(
          height: 15,
        ),
        Center(child: Image.asset('assets/images/minecloudLogo.png')),

        Container(
          width: kMediaQuerySize(context).width,
          height: 500,
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
                Text('Sign In', style: poppinsMedium()),
                darkTxtField(label: 'Email', hintText: 'Enter your Email...'),
                Column(
                  children: [
                    darkTxtField(
                        isPass: true,
                        label: 'Password',
                        hintText: 'Enter your Password...',
                        isPassHidden: isPassHidden,
                        onEyeTapped: () {
                          setState(() => isPassHidden = !isPassHidden);
                        }),
                    InkWell(
                      splashColor: kDetailedWhite60,
                      onTap: () =>
                          kPushNavigator(context, ResetPage()),
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 7.5),
                        child: Text('Forgot password?',
                            style: poppinsRegular().copyWith(
                              color: kDetailedWhite60,
                            )),
                      ),
                    ),
                  ],
                ),
                positiveButton('Log In', onPressed: () async {
                  showLoaderDialog(context, 'Logging you in...');
                  await Future.delayed(
                      const Duration(seconds: 3),
                      () =>
                          // todo Backend Email Auth Here.
                          // print('Login done.')
                          kNavigator(context).pop());
                  kPushNavigator(context,  DashBoard(), replace: true);
                }),
                Row(
                  children: [
                    containerDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR', style: poppinsRegular()),
                    ),
                    containerDivider(),
                  ],
                ),
                secondaryIconButton(
                  // todo Backend Google Auth Here.
                  text: 'Continue with Google',
                  iconW: SvgPicture.asset(
                    'assets/svg/G-logo-icon.svg',
                  ),
                ),
              ],
            ),
          ),
        ),

        // todo Add signup Page Here (& Backend).
        bottomDividerTxtBtn("Don't have an account? ", "Sign Up.",
            onTap: () => kPushNavigator(context,  SignupPage())),
      ],
    );
  }
}
