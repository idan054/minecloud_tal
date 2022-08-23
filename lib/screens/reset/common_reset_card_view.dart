import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/string_constants.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/services/auth_service.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:minecloud_tal/widgets/textFieldW.dart';

class CommonResetCardView extends StatelessWidget {
  final bool isWeb;
  final TextEditingController emailController = TextEditingController();

  CommonResetCardView({Key? key, this.isWeb = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget containerDivider() => Expanded(child: lightDivider());
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!isWeb)
          const SizedBox(height: 15),
        Center(child: Image.asset('assets/images/minecloudLogo.png')),
        Container(
          width: isWeb ? 400 : kMediaQuerySize(context).width,
          height: isWeb ? 350 : kMediaQuerySize(context).height * 0.5,
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
                Text(StringConstant.resetPassword, style: poppinsMedium()),
                darkTxtField(controller: emailController),
                const SizedBox(height: 30),
                positiveButton(StringConstant.sendEmail, onPressed: () => resetPassword(context),),
                Row(
                  children: [
                    containerDivider(),
                  ],
                ),
                secondaryIconButton(
                  text: StringConstant.logIn,
                  onPressed: () => kPushNavigator(context, const LoginScreen()),
                ),
              ],
            ),
          ),
        ),
        // todo Add signup Page Here (& Backend).
        bottomDividerTxtBtn(' ${StringConstant.signUp}.'),
      ],
    );
  }

  Future<void> resetPassword(BuildContext context) async {
    await AuthService.forgotPassword(context, emailController.text);
  }
}
