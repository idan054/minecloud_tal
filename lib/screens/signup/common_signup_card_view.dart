import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_show_dialog.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

class CommonSignUpCardView extends StatelessWidget {
  final bool isPassHidden;
  final bool isAgreeChecked;
  final bool isWeb;
  final GestureTapCallback? onEyeTapped;
  final ValueChanged<bool?>? onChanged;

  const CommonSignUpCardView(
      {Key? key,
      this.isPassHidden = true,
      this.onEyeTapped,
      this.isWeb = false,
      this.isAgreeChecked = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget containerDivider() => Expanded(child: lightDivider());
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
                darkTxtField(label: 'Email', hintText: 'Enter your Email...'),
                Column(
                  children: [
                    darkTxtField(
                        isPass: true,
                        label: 'Password',
                        hintText: 'Enter your Password...',
                        isPassHidden: isPassHidden,
                        onEyeTapped: onEyeTapped),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            fillColor:
                                MaterialStateProperty.all(kVerySpecificWhite40),
                            value: isAgreeChecked,
                            onChanged: onChanged),
                        bottomDividerTxtBtn("terms & Condition.",
                            showDivider: false, onTap: () {
                          commonShowDialog(
                              context: context,
                              title: 'Terms & Conditions',
                              desc:
                                  'fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes fdsfefeafce vefefe fewfewfew fegreh g4gresd dsfxfwefes',
                              buttonTitle: 'Delete',
                              showButtons: false);
                        }),
                        const Spacer()
                      ],
                    )
                  ],
                ),
                positiveButton('Sign Up', onPressed: () async {
                  showLoaderDialog(context, 'Creating your account...');
                  await Future.delayed(
                      const Duration(seconds: 3),
                      () =>
                          // todo Backend Email Auth Here.
                          kNavigator(context).pop());
                  kPushNavigator(context, const DashBoard(), replace: true);
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
        bottomDividerTxtBtn("Sign In.",
            startText: "Already have an account?",
            onTap: () =>
                kPushNavigator(context, const LoginScreen(), replace: true)),
      ],
    );
  }
}
