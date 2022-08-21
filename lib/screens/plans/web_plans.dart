import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/string_constants.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_plan.dart';
import 'package:minecloud_tal/functions/webpopups/buildIcons.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';
import 'package:minecloud_tal/widgets/worldPackTile/plansCleanTiles.dart';

class WebPlans extends StatefulWidget {
  const WebPlans({Key? key}) : super(key: key);

  @override
  State<WebPlans> createState() => WebPlansState();
}

class WebPlansState extends State<WebPlans> {
  @override
  Widget build(BuildContext context) {
    double height = maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: kEmptyColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100), // maxHeight(context) * 0.125
                    Text(
                      StringConstant.basicPlan,
                      style: poppinsMedium().copyWith(fontSize: 20),
                    ),
                    Text(
                      StringConstant.basicPlanDesc,
                      style: poppinsRegular().copyWith(fontSize: 12, color: kDetailedWhite60),
                    ),
                    const SizedBox(height: 50), // maxHeight(context) * 0.125
                    CommonPlan(),
                    const SizedBox(height: 35), // maxHeight(context) * 0.125
                    const PlansCleanTiles(),
                    //const Spacer(flex: 1,),
                    SizedBox(height: height * 10),
                    // todo connect to payment
                    SizedBox(
                      width: maxWidth(context) * 0.15,
                      child: positiveButton(StringConstant.continues, onPressed: () {}),
                    ),
                    const Spacer(),
                    // SizedBox(height: height * 10),
                    // todo connect open plans $ features
                    bottomDividerTxtBtn(StringConstant.plansFeatures, startText: StringConstant.learnMore),
                  ],
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
