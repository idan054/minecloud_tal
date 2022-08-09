import 'package:flutter/material.dart';
import 'package:minecloud_tal/Responsive/responsive.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/screens/plans/mobile_plans.dart';
import 'package:minecloud_tal/screens/plans/web_plans.dart';
import '../../common/theme/colors.dart';
import '../Dashboard/dashboard.dart';

class PlansPage extends StatelessWidget {
  PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      const MyResponsiveScreen(
        mobileScreen: MobilePlans(),
        webScreen: WebPlans(),
      );
  }
}

