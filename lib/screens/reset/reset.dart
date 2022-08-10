import 'package:flutter/material.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/reset/mobile_reset.dart';
import 'package:minecloud_tal/screens/reset/web_reset.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyResponsiveScreen(
      mobileScreen: MobileResetPass(),
      webScreen: WebResetPass(),
    );
  }
}
