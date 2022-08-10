import 'package:flutter/material.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/plans/mobile_plans.dart';
import 'package:minecloud_tal/screens/plans/web_plans.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyResponsiveScreen(
      mobileScreen: MobilePlans(),
      webScreen: WebPlans(),
    );
  }
}
