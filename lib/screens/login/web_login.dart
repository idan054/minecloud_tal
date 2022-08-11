import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/functions/webpopups/buildIcons.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/reset/reset.dart';
import 'package:minecloud_tal/screens/signup/signup.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  bool isPassHidden = true;

  Widget containerDivider() => Expanded(child: lightDivider());
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer t) {

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
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    var height =  maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                  height: height*2,
                ),
               buildIconRow(context),
              ],
            ),
          ),
          if(maxHeight(context) >1300)
          Expanded(flex: 2,child: Container(),),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: Image.asset('assets/images/minecloudLogo.png')),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                        Text('Sign In', style: poppinsMedium()),
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
                                  setState(
                                      () => isPassHidden = !isPassHidden);
                                }),
                            InkWell(
                              splashColor: kDetailedWhite60,
                              onTap: () => kPushNavigator(
                                  context, const ResetPage()),
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
                                  kNavigator(context).pop());
                          kPushNavigator(context,  const DashBoard(),
                              replace: true);
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
                bottomDividerTxtBtn("Sign Up.",
                    onTap: () => kPushNavigator(context,  const SignupPage())),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
