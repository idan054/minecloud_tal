import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/cleanDialogW.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/functions/webpopups/buildIcons.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

class WebSignup extends StatefulWidget {
  const WebSignup({Key? key}) : super(key: key);

  @override
  State<WebSignup> createState() => _WebSignupPageState();
}

class _WebSignupPageState extends State<WebSignup> {
  bool isPassHidden = true;
  bool isAgreeChecked = false;
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
      debugPrint('_selectedIndex $_selectedIndex');
      _pageController.animateToPage(_selectedIndex,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 250));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget containerDivider() => Expanded(child: lightDivider());
    var height = maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: kEmptyColor,
      body: Row(
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
                        Text('Sign Up', style: poppinsMedium()),
                        darkTxtField(
                            label: 'Email', hintText: 'Enter your Email...'),
                        Column(
                          children: [
                            darkTxtField(
                              isPass: true,
                              label: 'Password',
                              hintText: 'Enter your Password...',
                              isPassHidden: isPassHidden,
                              onEyeTapped: () {
                                setState(() => isPassHidden = !isPassHidden);
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3))),
                                  fillColor: MaterialStateProperty.all(
                                      kVerySpecificWhite40),
                                  value: isAgreeChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      isAgreeChecked = val!;
                                    });
                                  },
                                ),
                                bottomDividerTxtBtn("terms & Condition.",
                                    startText: "I agree to the ",
                                    showDivider: false, onTap: () {
                                  showCleanDialog(
                                    context,
                                    title: 'Terms & Conditions',
                                    desc:
                                        '''fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes''',
                                    showButtons: false,
                                  );
                                }),
                                const Spacer()
                              ],
                            )
                          ],
                        ),
                        positiveButton('Sign Up', onPressed: () async {
                          showLoaderDialog(
                              context, 'Creating your account...');
                          await Future.delayed(
                              const Duration(seconds: 3),
                              () =>
                                  // todo Backend Email Auth Here.
                                  // print('Login done.')
                                  kNavigator(context).pop());
                          kPushNavigator(context, const DashBoard(), replace: true);
                        }),
                        Row(
                          children: [
                            containerDivider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
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
                bottomDividerTxtBtn("Sign In.",startText: "Already have an account? ",
                    onTap: () => kPushNavigator(context, const LoginScreen(),
                        replace: true)),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
