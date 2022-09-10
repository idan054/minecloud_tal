import 'package:flutter/material.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/login/web_login.dart';
import 'package:minecloud_tal/screens/plans/mobile_plans.dart';

import 'mobile_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      const MyResponsiveScreen(
        mobileScreen: MobileLoginPage(),
        webScreen: WebLogin(),
      );
  }
}
