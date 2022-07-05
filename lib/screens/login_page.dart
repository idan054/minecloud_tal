import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../widgets/buttonsWs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: kMediaQuerySize(context).height * 0.2,),
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
                    customTxtField(label: 'Email', hintText: 'Enter your Email...'),
                    Column(
                      children: [
                        customTxtField(label: 'Password', hintText: 'Enter your Password...'),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 7.5),
                      child: Text('Forgot password?', style: poppinsRegular().copyWith(
                        color: kDetailedWhite60,
                        fontSize: 11
                      )),
                    ),
                      ],
                    ),
                    positiveButton('Log In')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
