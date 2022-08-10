
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/constants.dart';
import '../Dashboard/dashboard.dart';
import '../../functions/cleanDialogW.dart';
import '../../functions/loadingDialogW.dart';
import '../../widgets/components/login_bottom_sign_up.dart';
import '../../widgets/buttonsWs.dart';
import '../../widgets/simpleWs.dart';

class MobileSignup extends StatefulWidget {
  const MobileSignup({Key? key}) : super(key: key);

  @override
  State<MobileSignup> createState() => _MobileSignupPageState();
}

class _MobileSignupPageState extends State<MobileSignup> {
  bool isPassHidden = true;
  bool isAgreeChecked = false;

  @override
  Widget build(BuildContext context) {
    Widget containerDivider() => Expanded(child: lightDivider());

    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Column(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              fillColor: MaterialStateProperty.all(
                                  kVerySpecificWhite40),
                              value: isAgreeChecked,
                              onChanged: (val) {
                                setState(() {
                                  isAgreeChecked = val!;
                                });
                              },
                            ),
                            bottomDividerTxtBtn(
                                "terms & Condition.",
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
                      showLoaderDialog(context, 'Creating your account...');
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
            bottomDividerTxtBtn("Sign In.",startText: "Already have an account?",
                onTap: () =>
                    kPushNavigator(context,  const LoginScreen(), replace: true)),
          ],
        ),
      ),
    );
  }
}
