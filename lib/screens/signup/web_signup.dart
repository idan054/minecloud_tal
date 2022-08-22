import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/functions/webpopups/buildIcons.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';
import 'common_signup_card_view.dart';

class WebSignup extends StatefulWidget {
  const WebSignup({Key? key}) : super(key: key);

  @override
  State<WebSignup> createState() => _WebSignupPageState();
}

class _WebSignupPageState extends State<WebSignup> {
  bool isPassHidden = true;
  bool isAgreeChecked = false;

  @override
  Widget build(BuildContext context) {
    var height = maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: kEmptyColor,
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainBoardingSlider(),
                SizedBox(height: height * 2),
                buildIconRow(context),
              ],
            ),
          ),
          if (maxHeight(context) > 1300) Expanded(flex: 2, child: Container()),
          Expanded(
            flex: 3,
            child: CommonSignUpCardView(
              isPassHidden: isPassHidden,
              isWeb: true,
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
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
