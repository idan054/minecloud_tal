import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/functions/webpopups/buildIcons.dart';
import 'package:minecloud_tal/screens/login/common_login_card_view.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  bool isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    double height = maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
            child: CommonLoginCardView(
              isPassHidden: isPassHidden,
              isWeb: true,
              onEyeTapped: () {
                setState(() => isPassHidden = !isPassHidden);
              },
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
