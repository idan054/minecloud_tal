import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minecloud_tal/common/string_constants.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_show_dialog.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/services/auth_service.dart';
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

  CommonSignUpCardView(
      {Key? key,
      this.isPassHidden = true,
      this.onEyeTapped,
      this.isWeb = false,
      this.isAgreeChecked = false,
      this.onChanged})
      : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                Text(StringConstant.signUp, style: poppinsMedium()),
                darkTxtField(controller: emailController),
                Column(
                  children: [
                    darkTxtField(
                      controller: passwordController,
                      isPass: true,
                      label: StringConstant.password,
                      hintText: StringConstant.enterPassword,
                      isPassHidden: isPassHidden,
                      onEyeTapped: onEyeTapped,
                    ),
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
                        bottomDividerTxtBtn("${StringConstant.termsCondition.toLowerCase()}.",
                            showDivider: false, onTap: () {
                          commonShowDialog(
                              context: context,
                              title: StringConstant.termsCondition,
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
                positiveButton(
                  StringConstant.signUp,
                  onPressed: () async {
                    showLoaderDialog(context, text: StringConstant.creatingAccount);
                    await createUser(context);
                  },
                ),
                Row(
                  children: [
                    containerDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(StringConstant.or.toUpperCase(), style: poppinsRegular()),
                    ),
                    containerDivider(),
                  ],
                ),
                secondaryIconButton(
                  text: StringConstant.googleSignIn,
                  iconW: SvgPicture.asset('assets/svg/G-logo-icon.svg'),
                  onPressed: () => googleSignAuth(context),
                ),
              ],
            ),
          ),
        ),

        // todo Add signup Page Here (& Backend).
        bottomDividerTxtBtn("${StringConstant.signIn}.",
            startText: StringConstant.existAccount,
            onTap: () =>
                kPushNavigator(context, const LoginScreen(), replace: true)),
      ],
    );
  }

  Future<void> googleSignAuth(BuildContext context) async {
    UserCredential? userCredential =  await AuthService.signInWithGoogle(context);
    if (userCredential != null) {
      kPushNavigator(context, DashBoard(), replace: true);
    }
  }

  Future<void> createUser(BuildContext context) async {
    UserCredential? userCredential = await AuthService.createUser(context, emailController.text.trim(), passwordController.text.trim());
    await Future.delayed(
      const Duration(seconds: 3),
      () => kNavigator(context).pop(),
    );
    if(userCredential != null){
      kPushNavigator(context, DashBoard(), replace: true);
    }
  }
}
