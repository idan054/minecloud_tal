import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../functions/bottomSheetW.dart';
import '../widgets/buttonsWs.dart';
import '../widgets/components/login_bottomSignUp.dart';
import '../widgets/worldPackTile/plansCleanTiles.dart';
import '../widgets/worldPackTile/worldPackTileW.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
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

                ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.done,
                      color: Colors.blue,
                    ),
                    title: RichText(
                        text: TextSpan(
                      text: '125 MB ',
                      style: poppinsRegular()
                          .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'cloud storage',
                          style: poppinsRegular()
                              .copyWith(fontSize: 12, color: kDetailedWhite60),
                        )
                      ],
                    ))),

                ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.done,
                      color: Colors.blue,
                    ),
                    title: RichText(
                        text: TextSpan(
                      text: '2 ',
                      style: poppinsRegular()
                          .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'uploads & downloads per day',
                          style: poppinsRegular()
                              .copyWith(fontSize: 12, color: kDetailedWhite60),
                        )
                      ],
                    ))),

                ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.done,
                      color: Colors.blue,
                    ),
                    title: RichText(
                        text: TextSpan(
                      text: 'up to',
                      style: poppinsRegular()
                          .copyWith(fontSize: 12, color: kDetailedWhite60),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' 2 ',
                          style: poppinsRegular().copyWith(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'connected devices',
                          style: poppinsRegular()
                              .copyWith(fontSize: 12, color: kDetailedWhite60),
                        )
                      ],
                    ))),

                const SizedBox(height: 35), // maxHeight(context) * 0.125

                const PlansCleanTiles('Basic', 'Free foreverr'),
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
                bottomDividerTxtBtn("Learn more about our ", "plans & features."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
