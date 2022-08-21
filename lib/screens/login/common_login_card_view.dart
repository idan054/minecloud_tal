import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/reset/reset.dart';
import 'package:minecloud_tal/screens/signup/signup.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

class CommonLoginCardView extends StatelessWidget {
  final bool isPassHidden;
  final bool isWeb;
  final GestureTapCallback? onEyeTapped;

  const CommonLoginCardView(
      {Key? key,
      this.isPassHidden = true,
      this.onEyeTapped,
      this.isWeb = false})
      : super(key: key);

  Widget containerDivider() => Expanded(
        child: lightDivider(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!isWeb)
          const SizedBox(
            height: 15,
          ),
        Center(child: Image.asset('assets/images/minecloudLogo.png')),
        Container(
          width: isWeb ? 400 : kMediaQuerySize(context).width,
          height: 500,
          padding: EdgeInsets.symmetric(vertical: isWeb ? 20 : 0),
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
                        onEyeTapped: onEyeTapped),
                    InkWell(
                      splashColor: kDetailedWhite60,
                      onTap: () => kPushNavigator(context, const ResetPage()),
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
                  showLoaderDialog(context, text: 'Logging you in...');
                  await Future.delayed(
                      const Duration(seconds: 3),
                      () =>
                          // todo Backend Email Auth Here.
                          kNavigator(context).pop());
                  kPushNavigator(context, DashBoard(), replace: true);
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
        bottomDividerTxtBtn("Sign Up.",
            onTap: () => kPushNavigator(context, const SignupPage())),
      ],
    );
  }
}