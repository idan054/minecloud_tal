import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/functions/webpopups/buildicons.dart';
import 'package:minecloud_tal/screens/reset/common_reset_card_view.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';

class WebResetPass extends StatefulWidget {
  const WebResetPass({Key? key}) : super(key: key);

  @override
  State<WebResetPass> createState() => _WebResetPassState();
}

class _WebResetPassState extends State<WebResetPass> {

  @override
  Widget build(BuildContext context) {
    var height = maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: kEmptyColor,
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
          if (maxHeight(context) > 1300)
            Expanded(flex: 2, child: Container()),
          Expanded(
            flex: 3,
            child: CommonResetCardView(isWeb: true),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
