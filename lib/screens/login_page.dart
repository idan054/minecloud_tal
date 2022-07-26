import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/resetPass_page.dart';
import 'package:minecloud_tal/screens/signUp_page.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../dashboard.dart';
import '../functions/loadingDialogW.dart';
import '../widgets/builds/login_bottomSignUp.dart';
import '../widgets/buttonsWs.dart';
import '../widgets/simpleWs.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    Widget containerDivider() =>
        Expanded(child: lightDivider());

    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: kMediaQuerySize(context).height * 0.2,),
            const SizedBox(height: 15,),
            Center(
                child: Image.asset('assets/images/minecloudLogo.png')),

            Container(
              width: kMediaQuerySize(context).width,
              height: 500,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(gradient: darkPopupGradient,
                  borderRadius: const BorderRadius.all(Radius.circular(20)
              ),),
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
                            onEyeTapped: (){
                              setState(() =>
                                isPassHidden = !isPassHidden
                              );
                            }
                        ),
                    InkWell(
                      splashColor: kDetailedWhite60,
                      onTap: () =>
                          kPushNavigator(context, const ResetPassPage()),
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 7.5),
                        child: Text('Forgot password?', style: poppinsRegular().copyWith(
                          color: kDetailedWhite60,
                        )),
                      ),
                    ),
                      ],
                    ),
                    positiveButton('Log In',
                    onPressed: () async {
                        showLoaderDialog(context, 'Logging you in...');
                        await Future.delayed( const Duration(seconds: 3), () =>
                            // todo Backend Email Auth Here.
                            // print('Login done.')
                          kNavigator(context).pop()
                        );
                        kPushNavigator(context,
                            const Dashboard(), replace: true);
                      }
                    ),

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
                      iconW: SvgPicture.asset('assets/svg/G-logo-icon.svg',),
                    ),

                  ],
                ),
              ),
            ),

            // todo Add signup Page Here (& Backend).
            bottomDividerTxtBtn("Don't have an account? ", "Sign Up.",
            onTap: () => kPushNavigator(context, const SignupPage())),
          ],
        ),
      ),
    );
  }
}
