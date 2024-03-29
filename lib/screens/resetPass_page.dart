import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../widgets/components/login_bottomSignUp.dart';
import '../widgets/buttonsWs.dart';
import '../widgets/simpleWs.dart';
import 'login_page.dart';

class ResetPassMobile extends StatelessWidget{
  const ResetPassMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget containerDivider() =>
        Expanded(
          child: lightDivider(),
        );

    return Column(
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

                // todo Backend Email Reset Here.
                positiveButton('Send Email'),
                Row(
                  children: [containerDivider(),],
                ),

                secondaryIconButton(
                    text: 'Log In',
                    onPressed: () =>
                        kPushNavigator(context, const MainPage())
                ),

              ],
            ),
          ),
        ),

        // todo Add signup Page Here (& Backend).
        bottomDividerTxtBtn("Don't have an account? ", "Sign Up."),
      ],
    );
  }
}
