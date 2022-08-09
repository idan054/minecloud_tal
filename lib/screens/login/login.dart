import 'package:flutter/material.dart';

import 'package:minecloud_tal/screens/login/web_login.dart';


import '../Dashboard/dashboard.dart';
import '../plans/mobile_plans.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MyResponsiveScreen(
        mobileScreen: const MobilePlans(),
        webScreen: WebLogin(),
      );
  }
}
