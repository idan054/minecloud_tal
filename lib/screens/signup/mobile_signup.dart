import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/screens/signup/common_signup_card_view.dart';

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
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: CommonSignUpCardView(
          isPassHidden: isPassHidden,
          isAgreeChecked: isAgreeChecked,
          onEyeTapped: () {
            setState(() => isPassHidden = !isPassHidden);
          },
          onChanged: (val) {
            setState(() {
              isAgreeChecked = val!;
            });
          },
        ),
      ),
    );
  }
}
