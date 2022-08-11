import 'package:flutter/material.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/login/web_login.dart';
import 'package:minecloud_tal/screens/plans/mobile_plans.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      const MyResponsiveScreen(
        mobileScreen: MobilePlans(),
        webScreen: WebLogin(),
      );
  }
}
