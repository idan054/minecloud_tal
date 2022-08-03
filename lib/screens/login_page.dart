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
              Widget currentPage = const ResetPassMobile();

              return const 5;
            } else {
              return Row(
                children: [
                  Flexible(
                    child: MainBoardingSlider(_selectedIndex, _pageController),
                  ),
                  const SizedBox(width: 400,
                      // child: LoginMobile()
                      child: ResetPassMobile()
                  ),
                ],
              );
            }
          })),
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
                          kPushNavigator(context, const ResetPassMobile()),
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
                  kPushNavigator(context, const Dashboard(), replace: true);
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
            onTap: () => kPushNavigator(context, const SignupPage())),
      ],
    );
  }
}
