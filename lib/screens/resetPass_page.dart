import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../widgets/buttonsWs.dart';
import 'login_page.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    Widget containerDivider() =>
        Expanded(
          child: Container(
            color: kTapBorderAssets,
            height: 1,),
        );

    return Container(
      decoration: BoxDecoration(gradient: darkBackgroundGradient),
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
              height: kMediaQuerySize(context).height * 0.5,
              // height: 500,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(gradient: darkPopupGradient,
                  borderRadius: const BorderRadius.all(Radius.circular(20)
              ),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Reset Password', style: poppinsMedium()),
                    darkTxtField(label: 'Email', hintText: 'Enter your Email...'),
                    const SizedBox(height: 30,),

                    positiveButton('Send Email'),
                    Row(
                      children: [containerDivider(),],
                    ),

                    secondaryIconButton(
                      text: 'Log In',
                      // SvgPicture.asset('assets/svg/G-logo-icon.svg',),
                    ),

                  ],
                ),
              ),
            ),

            buildBottomSignup()
          ],
        ),
      ),
    );
  }
}
