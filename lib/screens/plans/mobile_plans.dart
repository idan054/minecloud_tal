import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_plan.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';
import 'package:minecloud_tal/widgets/components/login_bottom_sign_up.dart';
import 'package:minecloud_tal/widgets/worldPackTile/plansCleanTiles.dart';

class MobilePlans extends StatefulWidget {
  const MobilePlans({Key? key}) : super(key: key);

  @override
  State<MobilePlans> createState() => _MobilePlansState();
}

class _MobilePlansState extends State<MobilePlans> {
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(height: 100), // maxHeight(context) * 0.125
                Text(
                  'Basic Plan',
                  style: poppinsMedium().copyWith(fontSize: 20),
                ),
                Text(
                  'Sync a fair size of your assets for free.',
                  style: poppinsRegular()
                      .copyWith(fontSize: 12, color: kDetailedWhite60),
                ),
                const SizedBox(height: 50), // maxHeight(context) * 0.125
                CommonPlan(),
                const SizedBox(height: 35), // maxHeight(context) * 0.125
                const PlansCleanTiles('Basic', 'Free forever'),
                const Spacer(),
                // todo connect to payment
                SizedBox(
                  width: maxWidth(context)*0.75,
                  child: positiveButton('Continue',
                      onPressed: () {}
                  ),
                ),
                const Spacer(),
                // todo connect open plans $ features
                bottomDividerTxtBtn( "plans & features.", startText: "Learn more about our "),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
