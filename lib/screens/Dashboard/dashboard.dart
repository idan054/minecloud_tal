import 'package:flutter/material.dart';
import 'package:minecloud_tal/Responsive/responsive.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/screens/Dashboard/mobile_dasboard.dart';
import 'package:minecloud_tal/screens/Dashboard/web_dashboard.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: const Scaffold(
        backgroundColor: kEmptyColor,
        body: ResponsiveLayout(
          mobileLayout: MobileDashboard(),
          webLayout: WebDashBoard(),
        ),
      ),
    );
  }
}

class MyResponsiveScreen extends StatelessWidget {
  final Widget mobileScreen;
  final Widget webScreen;

  const MyResponsiveScreen({
        required this.mobileScreen,
        required this.webScreen, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = maxHeight(context) / 100;
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
          backgroundColor: kEmptyColor,
          body: LayoutBuilder(
            builder: ((context, constraints) {
              if (constraints.maxWidth < 1050) {
                return mobileScreen;
              } else {
                return Stack(children: [
                  Container(
                    decoration:
                        const BoxDecoration(gradient: darkBackgroundGradient),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 5),
                            child: Image.asset(
                              'assets/images/bgoverlay1.png',
                              fit: BoxFit.fill,
                              width: height * 100,
                              height: height * 100,
                            ),
                          ),
                        ),
                        Expanded(flex: 3, child: Container()),
                        Expanded(
                          flex: 2,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                'assets/images/overlay2.png',
                              )),
                        ),
                      ],
                    ),
                  ),
                  webScreen,
                ]);
              }
            }),
          )),
    );
  }
}
